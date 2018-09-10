from django.db import models

# Create your models here.
class InstrumentApplication(models.Model):
    # caregiver = models.ForeignKey(Caregiver, null= False, blank = False, on_delete=models.CASCADE)
    period = models.SmallIntegerField()
    year = models.CharField(max_length=4)
    STATUS_APP=(('A','Activa'),('I','Inactiva'))
    status = models.CharField(max_length=1, choices= STATUS_APP, default='A')
    created = models.DateTimeField(auto_now_add=True, verbose_name="Fecha de creación")
    updated = models.DateTimeField(auto_now=True, verbose_name="Fecha de edición")

    class Meta:
        verbose_name = "Aplicación de Instrumentos"
        verbose_name_plural = "Aplicaciones de Instrumentos"
        ordering = ["-created"]

    def __str__(self):
        cadena = "Aplicación {0} del año {1}"
        return cadena.format(self.period, self.year)

class Instrument(models.Model):
    name = models.CharField(max_length=80)
    indicator = models.CharField(max_length=80)
    instructions = models.CharField(max_length=350)
    STATUS_INS=(('A','Activo'),('I','Inactivo'))
    status = models.CharField(max_length=1, choices= STATUS_INS, default='A')
    maxValue = models.SmallIntegerField()
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
    score = models.SmallIntegerField()
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

