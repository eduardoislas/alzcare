from django.db import models
from django.contrib.auth.models import User

# Create your models here.


""" 
Modelos utilizados en la entrevista inicial.
"""
"""
DTOS
"""
class adult_DTO():
    name = models.CharField(max_length=60)
    phase = models.SmallIntegerField()

class Adult(models.Model):
    name = models.CharField(max_length=60, verbose_name="Nombre(s)")
    lastName = models.CharField(max_length=60, verbose_name="Apellido Paterno")
    mLastName = models.CharField(max_length=60, verbose_name="Apellido Materno")
    birthDate = models.DateField(verbose_name="Fecha de nacimiento")
    CIVIL_STATUS=(('C','Casado(a)'),('D','Divorciado(a)'),('V','Viudo(a)'),('S','Soltero(a)'),('U','Unión Libre'))
    civilStatus = models.CharField(max_length=1, choices = CIVIL_STATUS, default='C',verbose_name="Estado civil")
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
    email = models.EmailField(max_length=100, verbose_name="Correo electrónico")
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
    email = models.EmailField(max_length=100, verbose_name="Correo electrónico")
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
    caregiver = models.OneToOneField(Caregiver, unique=True, on_delete=models.CASCADE)
    q1 = models.CharField(max_length=200, verbose_name="¿Cuáles cree usted que serían ls principales necesidades que tendría que enfrentar como cuidador de una persona con Alzheimer?")
    options=(('S','Si'),('N','No'))
    q2 = models.CharField(max_length=1, choices=options, default='S', verbose_name="¿Recibe usted ayuda de otros familiares para solventar los costos de la enfermedad?")
    q3 = models.CharField(max_length=100, verbose_name="¿De quién?", null=True, blank = True)
    q4 = models.CharField(max_length=1, choices=options, default='S', verbose_name="¿Considera usted que en algún momento dejaría de ser cuidador?")
    q5 = models.CharField(max_length=100, verbose_name="¿Por qué?", null=True, blank = True)
    q6 = models.PositiveIntegerField(verbose_name="¿En una escala del 1 al 10 siendo 1 muy mal y 10 excelente cómo considera que se encuentra su familia en estos momentos?")
    q7 = models.CharField(max_length=100, verbose_name="¿Por qué?", null=True, blank = True)
    q8 = models.TextField(verbose_name="¿Cómo se ha informado la familia sobre la enfermedad ALZHEIMER?", null=True, blank = True)
    q9 = models.TextField(verbose_name="¿Cómo concibe la familia la enfermedad de ALZHEIMER?", null=True, blank = True)
    q10 = models.TextField(verbose_name="¿Qué representa para ustedes en estos momentos de su vida que su familiar padezca de Alzheimer?", null=True, blank = True)
    q11 = models.CharField(max_length=100, verbose_name="¿Comparte usted con algún familiar estos sentimientos?", null=True, blank = True)
    q12 = models.TextField(verbose_name="¿Cual es la parte más difícil que han tenido que afrontar como familia ante esta enfermedad?", null=True, blank = True)
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
    STYLE_OPTION=((1,'Misma escala'),('2','Escala por pregunta'),('3','Misma Escala/Entrevista'))
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
    percentage = models.DecimalField(max_digits=4, decimal_places=1, verbose_name="Porcentaje",null= True, blank = True)

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

