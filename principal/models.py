from django.db import models
from django.contrib.auth.models import User

# Create your models here.


""" 
Modelos utilizados en la entrevista inicial.
"""
class Adult(models.Model):
    name = models.CharField(max_length=60, verbose_name="Nombre(s)")
    lastName = models.CharField(max_length=60, verbose_name="Apellido Paterno")
    mLastName = models.CharField(max_length=60, verbose_name="Apellido Materno")
    birthDate = models.DateField(verbose_name="Fecha de nacimiento")
    CIVIL_STATUS=(('C','Casado(a)'),('D','Divorciado(a)'),('V','Viudo(a)'),('S','Soltero(a)'),('U','Unión Libre'))
    civilStatus = models.CharField(max_length=1, choices = CIVIL_STATUS, default='C')
    SEXOS=(('F','Femenino'),('M','Masculino'))
    phase = models.SmallIntegerField(verbose_name="Fase")
    gender=models.CharField(max_length=1, choices=SEXOS, default ='F', verbose_name="Género")
    nacionality = models.CharField(max_length=60, verbose_name="Nacionalidad", default="Mexicana")
    religion = models.CharField(max_length=60, verbose_name="Religión", default="Católica")
    birthPlace = models.CharField(max_length=60, verbose_name="Lugar de nacimiento")
    STATUS_AD=(('A','Activo'),('B','Baja'), ('F','Finado'))
    status = models.CharField(max_length=1, choices= STATUS_AD, default='A')
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Adulto"
        verbose_name_plural = "Adultos"
        ordering = ["-created"]

    def __str__(self):
        cadena = "{1} {2}, {0}"
        return cadena.format(self.name, self.lastName, self.mLastName)


class Caregiver(models.Model):
    adult = models.ForeignKey(Adult, null=False, blank = False ,verbose_name="Adulto", on_delete=models.CASCADE)
    name = models.CharField(max_length=60, verbose_name="Nombre(s)")
    lastName = models.CharField(max_length=60, verbose_name="Apellido Paterno")
    mLastName = models.CharField(max_length=60, verbose_name="Apellido Materno")
    RELATION = (('E','Esposo(a)'),('H','Hijo(a)'),('A','Amigo(a)'),('F','Familiar'))
    relationship = models.CharField(max_length=1, choices = RELATION , default = 'E',verbose_name="Parentesco")
    email = models.CharField(max_length=100, verbose_name="Correo electrónico")
    phone = models.CharField(max_length=20, verbose_name="Teléfono/Celular")
    address = models.CharField(max_length=80, verbose_name="Domicilio")
    CIVIL_STATUS=(('C','Casado(a)'),('D','Divorciado(a)'),('V','Viudo(a)'),('S','Soltero(a)'),('U','Unión Libre'))
    civilStatus = models.CharField(max_length=1, choices = CIVIL_STATUS, default='S')
    SEXOS=(('F','Femenino'),('M','Masculino'))
    gender=models.CharField(max_length=1, choices=SEXOS, default ='F', verbose_name="Género")
    religion = models.CharField(max_length=40, verbose_name="Religión")
    ocupation = models.CharField(max_length=60, verbose_name="Ocupación")
    isPrincipal = models.BooleanField(default = True, verbose_name="Cuidador principal")
    availability = models.TextField(verbose_name="Tiempo disponible para tratar asuntos relacionados al cuidado del adulto", null=True, blank=True)
    availabilityHome = models.TextField(verbose_name="Tiempo disponible para atención del adulto en casa", null=True, blank=True)
    reason = models.TextField(verbose_name="Razón por la que es el cuidador principal", null=True, blank=True)
    STATUS_CG=(('A','Activo'),('I','Inactivo'))
    status = models.CharField(max_length=1, choices= STATUS_CG, default='A')
    user = models.OneToOneField(User, unique=True, on_delete=models.CASCADE,null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Cuidador"
        verbose_name_plural = "Cuidadores"
        ordering = ["-created"]

    def __str__(self):
        cadena = "{1} {2}, {0}"
        return cadena.format(self.name, self.lastName, self.mLastName)

class Tutor(models.Model):
    adult = models.ForeignKey(Adult, null=False, blank = False ,verbose_name="Adulto", on_delete=models.CASCADE)
    name = models.CharField(max_length=60, verbose_name="Nombre(s)")
    lastName = models.CharField(max_length=60, verbose_name="Apellido Paterno")
    mLastName = models.CharField(max_length=60, verbose_name="Apellido Materno")
    RELATION = (('E','Esposo(a)'),('H','Hijo(a)'),('A','Amigo(a)'),('F','Familiar'))
    relationship = models.CharField(max_length=1, choices = RELATION , default = 'E',verbose_name="Parentesco")
    email = models.CharField(max_length=100, verbose_name="Correo electrónico")
    phone = models.CharField(max_length=20, verbose_name="Teléfono/Celular")
    address = models.CharField(max_length=80, verbose_name="Domicilio")
    SEXOS=(('F','Femenino'),('M','Masculino'))
    gender=models.CharField(max_length=1, choices=SEXOS, default ='F', verbose_name="Género")
    reason = models.TextField(verbose_name="Razón por la que es el Tutor", null=True, blank=True)
    knowledge = models.BooleanField(verbose_name="¿Conoce responsabilidades morales y legales que se asumen como tutor?")
    observation = models.TextField(verbose_name="Observaciones")
    STATUS_CG=(('A','Activo'),('I','Inactivo'))
    status = models.CharField(max_length=1, choices= STATUS_CG, default='A')
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Tutor"
        verbose_name_plural = "Tutores"
        ordering = ["-created"]

    def __str__(self):
        cadena = "{1} {2}, {0}"
        return cadena.format(self.name, self.lastName, self.mLastName)

class Interview(models.Model):
    adult = models.OneToOneField(Adult, unique=True, on_delete=models.CASCADE)
    q1 = models.CharField(max_length=60, verbose_name="Prueba aún....")
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Entrevista inicial"
        verbose_name_plural = "Entrevistas iniciales"
        ordering = ["-created"]

    def __str__(self):
        cadena = "Entrevista incial correspondiente a {0}"
        return cadena.format(self.adult)

""" 
Modelos utilizados en la creación dinámica de instrumentos, así como su aplicación y guardar resultados.
"""
class InstrumentApplication(models.Model):
    period = models.SmallIntegerField()
    year = models.CharField(max_length=4)
    STATUS_APP=(('A','Activa'),('I','Inactiva'))
    status = models.CharField(max_length=1, choices= STATUS_APP, default='A')
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Valoración"
        verbose_name_plural = "Valoraciones"
        ordering = ["-created"]

    def __str__(self):
        cadena = "Valoración {0} del año {1}"
        return cadena.format(self.period, self.year)

class Instrument(models.Model):
    name = models.CharField(max_length=80)
    indicator = models.CharField(max_length=80)
    instructions = models.CharField(max_length=350)
    STATUS_INS=(('A','Activo'),('I','Inactivo'))
    status = models.CharField(max_length=1, choices= STATUS_INS, default='A')
    maxValue = models.SmallIntegerField()
    STYLE_OPTION=((1,'Misma escala'),('2','Escala por pregunta'))
    style = models.SmallIntegerField(choices= STYLE_OPTION, default=1, verbose_name="Tipo de cuestionario")
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Instrumento"
        verbose_name_plural = "Instrumentos"
        ordering = ["-created"]

    def __str__(self):
        cadena = "Escala {0} para medir {1}"
        return cadena.format(self.name, self.indicator)

class Scale(models.Model):
    description = models.CharField(max_length=150)

    class Meta:
        verbose_name = "Escala de Respuestas"
        verbose_name_plural = "Escalas de Respuestas"

    def __str__(self):
        cadena = "Escala {0}"
        return cadena.format(self.description)

class Option(models.Model):
    description = models.CharField(max_length=80)
    value = models.SmallIntegerField()
    scale = models.ForeignKey(Scale, null=False, blank = False , on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Opción"
        verbose_name_plural = "Opciones"

    def __str__(self):
        cadena = "{0} - {1}"
        return cadena.format(self.value, self.description) 

class Question(models.Model):
    instrument = models.ForeignKey(Instrument, null=False, blank = False , on_delete=models.CASCADE)
    item = models.SmallIntegerField()
    description = models.CharField(max_length=150)
    scale = models.ForeignKey(Scale, null=True, blank = True , on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Pregunta"
        verbose_name_plural = "Preguntas"

    def __str__(self):
        cadena = "Pregunta {0} del instrumento {1}, {2}"
        return cadena.format(self.item, self.instrument.name, self.description)

class InstrumentResult(models.Model):
    instrument = models.ForeignKey(Instrument, null=False, blank = False , on_delete=models.CASCADE)
    iapplication = models.ForeignKey(InstrumentApplication, null=False, blank = False , on_delete=models.CASCADE)
    caregiver = models.ForeignKey(Caregiver, null= False, blank = False, on_delete=models.CASCADE)
    score = models.SmallIntegerField()
    STATUS_INS=(('A','Activo'),('C','Contestado'))
    status = models.CharField(max_length=1, choices= STATUS_INS, default='A')
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Resultado de Instrumento"
        verbose_name_plural = "Resultados de Instrumento"
        ordering = ["-created"]

    def __str__(self):
        cadena = "Resultado del instrumento {0}, de la aplicación {1} del año {2}"
        return cadena.format(self.instrument.name, self.iapplication.period, self.iapplication.year)
    
class Answer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    option = models.ForeignKey(Option, on_delete=models.CASCADE)
    instrumentResult = models.ForeignKey(InstrumentResult, on_delete=models.CASCADE)

    class Meta:
        verbose_name = "Respuesta"
        verbose_name_plural = "Respuestas"

    def __str__(self):
        cadena = "Se respondió {0} a la pregunta {1} del instrumento {2}"
        return cadena.format(self.option.value, self.question.item, self.question.instrument.name) 

