from django.shortcuts import render
from .models import *

# Create your views here.

def home (request):
    return render(request,"principal/home.html") 

def instrumentos (request):
    instruments = Instrument.objects.all()
    return render(request,"principal/instrumentos.html",{'instruments':instruments})

def instrumento (request):
    id = int(request.POST.get('instrumento'))
    instrument = Instrument.objects.get(pk=id)
    questions = Question.objects.filter(instrument_id=id)
    for q in questions:
        idScale = q.scale_id
        break
    options = Option.objects.filter(scale_id=idScale)
    return render(request,"principal/instrument.html",{'instrument':instrument, 'questions':questions, 'options':options})
    
def login (request):
    return render(request,"principal/login.html") 

