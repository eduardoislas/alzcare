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
    return render(request,"principal/instrument.html",{'instrument':instrument, 'questions':questions})
    
def login (request):
    return render(request,"principal/login.html") 

