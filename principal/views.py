from django.shortcuts import render 
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from .models import *

import json
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
    if instrument.style==1:
        for q in questions:
            idScale = q.scale_id
            break
        options = Option.objects.filter(scale_id=idScale)   
    elif instrument.style==2:
        options = Option.objects.all()
    return render(request,"principal/instrument/instrument.html",{'instrument':instrument, 'questions':questions, 'options':options, 'instrument':instrument, 'application':iapp})

def resultQuiz(request):
    #Datos hardcodeados
    idIns = request.POST.get('instrument')
    idApp = request.POST.get('application')
    instrument = Instrument.objects.get(pk=idIns)
    #Datos hardcodeados
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
    iresult.save()
    return JsonResponse({'success' : 'true',  'mensaje': 'Se guardo con exito' },safe=False)

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
    dict

class CaregiverCreate(CreateView):
    model=Caregiver
    template_name="principal/caregiver/caregiver_create.html"
    fields = ['adult','name','lastName','mLastName','civilStatus','ocupation','relationship','email','phone','address','gender','status','availability','isPrincipal',
    'reason']

# Gestión de Periodos de Aplicación
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
    instrumentresults = InstrumentResult.objects.all()
    caregivers = Caregiver.objects.filter(status="A")
    return render(request,"principal/result/results.html",{"applications":applications, "caregivers":caregivers,"instrumentresults":instrumentresults}) 

def resultsDetail (request):
    #Datos Hardcodeados - Debe recibir idCuidador y el idApplication
    caregiver = Caregiver.objects.get(pk=1)
    app = InstrumentApplication.objects.get(pk=2)
    iResults = InstrumentResult.objects.filter(caregiver=1, iapplication=2)
    return render(request,"principal/result/results_detail.html",{"iResults":iResults, "caregiver":caregiver, "app":app}) 