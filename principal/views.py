from django.shortcuts import render
from .models import Instrument

# Create your views here.

def home (request):
    return render(request,"principal/home.html") 

def instrumentos (request):
    instruments = Instrument.objects.all()
    return render(request,"principal/instrumentos.html",{'instruments':instruments})

    
def login (request):
    return render(request,"principal/login.html") 

