from django.db import models
import uuid
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

def validate_phone_number(value):
    if len(value) != 11 or not value.isdigit():
        raise ValidationError(_('Phone number must be 11 digits long.'))


class Company(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company_name = models.CharField(max_length=255)
    company_address = models.TextField()
    phone_number = models.CharField(max_length=11, validators=[validate_phone_number])
    def __str__(self):
        return self.company_name


class SubCompany(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    parent_company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='sub_companies')
    sub_company_name = models.CharField(max_length=255)
    sub_company_address = models.TextField()
    phone_number = models.CharField(max_length=11, validators=[validate_phone_number])

    def __str__(self):
        return self.sub_company_name or "SubCompany"


class Site(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company = models.ForeignKey(Company, null=True, blank=True, on_delete=models.CASCADE)
    sub_company = models.ForeignKey(SubCompany, null=True, blank=True, on_delete=models.CASCADE)
    site_name = models.CharField(max_length=255)
    site_address = models.TextField()
    phone_number = models.CharField(max_length=11, validators=[validate_phone_number])
    location_url = models.URLField(max_length=200, null=True, blank=True)
    comment = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.site_name



