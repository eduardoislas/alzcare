"""alzcare URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from principal import views
from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from principal.views import *

urlpatterns = [
      path('', auth_views.LoginView.as_view(template_name='registration/login.html')),
    path('admin/', admin.site.urls),
    path('home/', login_required(views.home), name="home"),

  #Gestión de Instrumentos
    path('instrumentos/',login_required(views.instrumentos), name = "instrumentos"),
    path('instrumento/',login_required(views.instrumento), name = "instrumento"),
    path('results',login_required(views.resultQuiz), name = "resultQuiz"),
    path('valoration/', login_required(ValorationListView.as_view()), name="valoration_list"),
    path('valoration_create/', login_required(ValorationCreate.as_view(success_url="/valoration/")), name="valoration_create"),
  # paths de auth
    path('accounts/', include('django.contrib.auth.urls')),
  #CRUD Adultos
    path('getAdults_json', login_required(views.getAdults_json), name="adults_json"),
    path('adults/', login_required(views.adult_list), name= "adults_list"),
    path('adult/', login_required(AdultListView.as_view()), name="adult_list"),
    path('adult/<int:pk>/', login_required(AdultDetailView.as_view()), name="adult_detail"),
    path('adult_create/', login_required(AdultCreate.as_view(success_url="/adult/")), name="adult_create"),

  #CRUD Tutores
    path('tutor/', login_required(TutorListView.as_view()), name="tutor_list"),
    path('tutor/<int:pk>/', login_required(TutorDetailView.as_view()), name="tutor_detail"),
    path('tutor_create/', login_required(TutorCreate.as_view(success_url="/tutor/")), name="tutor_create"),

  #CRUD Cuidadores
    path('caregiver/', login_required(CaregiverListView.as_view()), name="caregiver_list"),
    path('caregiver/<int:pk>/', login_required(CaregiverDetailView.as_view()), name="caregiver_detail"),
    path('caregiver_create/', login_required(CaregiverCreate.as_view(success_url="/caregiver/")), name="caregiver_create"),

  #Mostrar resultados
    path('results/', login_required(views.results), name="results"),
    path('resultsDetail/', login_required(views.resultsDetail), name="resultsDetail"),
]
