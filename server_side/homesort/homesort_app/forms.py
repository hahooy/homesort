from django import forms
from homesort_app.models import Shelter


class ShelterForm(forms.ModelForm):
    class Meta:
        model = Shelter
        # fields = ('picture',)