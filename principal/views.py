from django.shortcuts import render 
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from .models import *

import json
from django.core import serializers
from django.http import JsonResponse


# Create your views here.

def home (request):
    return render(request,"principal/home.html") 

def login (request):
    return render(request,"principal/login.html") 

# Gestión de instrumentos   
def instrumentos (request):
    applications = InstrumentApplication.objects.all()
    caregiver = Caregiver.objects.get(user=request.user)
    contestados = []
    porContestar = []
    for app in applications:
        if app.status == "A":   
            instruments = list(Instrument.objects.filter(status="A").order_by('id'))
            for i in instruments:
                contestado = InstrumentResult.objects.filter(caregiver=caregiver.id, iapplication=app.id, instrument=i.id)
                if contestado.exists() == False:
                    porContestar.append(i)
            return render(request,"principal/instrument/instrumentos.html",{'instruments':instruments, 'app':app, 'caregiver':caregiver, 'porContestar':porContestar})
    return render(request,"principal/home.html")

def instrumento (request):
    id = int(request.POST.get('instrumento'))
    instrument = Instrument.objects.get(pk=id)
    iapp = InstrumentApplication.objects.get(pk=int(request.POST.get('application')))
    questions = Question.objects.filter(instrument_id=id)
    scales=[]
    options =[]
    if instrument.style==1 or instrument.style==3:
        for q in questions:
            idScale = q.scale_id
            break
        options = Option.objects.filter(scale_id=idScale)   
    elif instrument.style==2:
        options = Option.objects.all()
    return render(request,"principal/instrument/instrument.html",{'instrument':instrument, 'questions':questions, 'options':options, 'application':iapp})

def resultQuiz(request):
    idIns = request.POST.get('instrument')
    idApp = request.POST.get('application')
    instrument = Instrument.objects.get(pk=idIns)
    iapp = InstrumentApplication.objects.get(pk=idApp)
    iresult = InstrumentResult()
    iresult.instrument = instrument
    iresult.iapplication = iapp
    iresult.caregiver = Caregiver.objects.get(user=request.user)
    iresult.score = 0
    iresult.save()
    respuestas = request.POST.get('result_list')
    datas  = json.loads(respuestas)
    score=0
    for a in datas:
        answer = Answer()
        answer.question = Question.objects.get(pk = a['question'])
        answer.option = Option.objects.get(pk = a['option']) 
        answer.instrumentResult = iresult
        answer.save()
        score+= answer.option.value
    iresult.score=score
    iresult.percentage = (score*100)/instrument.maxValue
    ##Para guardar la siguiente línea se requieren ciertas reglas de negocio (quedan pendientes)
    iresult.range = "bajo"
    iresult.save()
    return JsonResponse({'success' : 'true',  'mensaje': 'Se guardó con éxito' },safe=False)

## Adultos
def adult_list(request):
    return render(request, "principal/adult/adult_list.html")
    
def getAdults_json(request):
    adultos = list(Adult.objects.all())
    adultos_model = []
    for ad in adultos:
        adulto_model = adult_DTO()
        adulto_model.name = ad.__str__() #ad.name + " "+ ad.lastName+ " "+ad.mLastName
        adulto_model.phase = ad.phase
        adultos_model.append(adulto_model)

    serialized_obj = serializers.serialize('json', adultos)

    return JsonResponse(serialized_obj,safe=False)

# Gestión de adultos
class AdultListView(ListView):
    model=Adult
    template_name="principal/adult/adult_list.html"

class AdultDetailView(DetailView):
    model=Adult
    template_name="principal/adult/adult_detail.html"

class AdultCreate(CreateView):
    model=Adult
    template_name="principal/adult/adult_create.html"
    fields = ['name','lastName','mLastName','birthDate','civilStatus','gender','phase','nacionality','religion',
    'birthPlace']

# Gestión de tutores
class TutorListView(ListView):
    model=Tutor
    template_name="principal/tutor/tutor_list.html"

class TutorDetailView(DetailView):
    model=Tutor
    template_name="principal/tutor/tutor_detail.html"

class TutorCreate(CreateView):
    model=Tutor
    template_name="principal/tutor/tutor_create.html"
    fields = ['adult','name','lastName','mLastName','relationship','email','phone','address','gender','knowledge','observation','status',
    'reason']

# Gestión de Cuidadores
class CaregiverListView(ListView):
    model=Caregiver
    template_name="principal/caregiver/caregiver_list.html"

class CaregiverDetailView(DetailView):
    model=Caregiver
    template_name="principal/caregiver/caregiver_detail.html"

class CaregiverCreate(CreateView):
    model=Caregiver
    template_name="principal/caregiver/caregiver_create.html"
    fields = ['adult','name','lastName','mLastName','relationship','civilStatus','ocupation','email','phone','address','gender','religion','status','availability','availabilityHome','isPrincipal',
    'reason','user']

class InterviewCreate(CreateView):
    model=Interview
    template_name="principal/caregiver/interview_create.html"
    fields = ['caregiver','q1','q2','q3','q4','q5','q6','q7','q8','q9','q10','q11','q12']

# Gestión de Periodos de Valoración
class ValorationListView(ListView):
    model=InstrumentApplication
    template_name="principal/instrument/valoration_list.html"

class ValorationCreate(CreateView):
    model=InstrumentApplication
    template_name="principal/instrument/valoration_create.html"
    fields = ['period','year','status']

# Mostrar resultados al psicólogo
def results (request):
    applications = InstrumentApplication.objects.all()
    return render(request,"principal/result/results.html",{"applications":applications}) 

def resultsList(request):
    app = InstrumentApplication.objects.get(pk=request.POST.get('valoration'))
    caregivers = Caregiver.objects.filter(status="A")
    iResults = list(InstrumentResult.objects.filter(iapplication=app).select_related('caregiver'))
    return render(request,"principal/result/results_list.html",{"iResults":iResults, "caregivers":caregivers, "app":app}) 

def resultsDetail (request):
    idc = int(request.POST.get('caregiver'))
    idv = int(request.POST.get('valoration'))
    caregiver = Caregiver.objects.get(pk=idc)
    app = InstrumentApplication.objects.get(pk=idv)
    iResults = InstrumentResult.objects.filter(caregiver=idc, iapplication=idv)
    return render(request,"principal/result/results_detail.html",{"iResults":iResults, "caregiver":caregiver, "app":app}) 