from django.shortcuts import render
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView
from .models import *


# Create your views here.

def home (request):
    return render(request,"principal/home.html") 

def instrumentos (request):
    opciones = []
    if request.method == 'POST':
        answers = []
        opciones = request.POST.get("respuesta")
    instruments = Instrument.objects.filter(status="A").order_by('id')
    return render(request,"principal/instrumentos.html",{'instruments':instruments, 'opciones':opciones})

def instrumento (request):
    id = int(request.POST.get('instrumento'))
    instrument = Instrument.objects.get(pk=id)
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
    return render(request,"principal/instrument.html",{'instrument':instrument, 'questions':questions, 'options':options})
    
def login (request):
    return render(request,"principal/login.html") 

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
    'birthPlace', 'isPrincipal']