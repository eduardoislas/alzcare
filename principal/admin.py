from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(InstrumentApplication)
admin.site.register(Instrument)
admin.site.register(Option)
admin.site.register(Question)
admin.site.register(InstrumentResult)
admin.site.register(Answer)