from django.db import models
import uuid
from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

def validate_phone_number(value):
    if len(value) != 11 or not value.isdigit():
        raise ValidationError(_('Phone number must be 11 digits long.'))

class City(models.Model):
    name = models.CharField(max_length=100, unique=True)
    def __str__(self):
        return self.name


class Area(models.Model):
    name = models.CharField(max_length=100)
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name='areas')

    def __str__(self):
        return self.name

class Company(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company_name = models.CharField(max_length=255)
    manager = models.CharField(max_length=255,null=True)
    company_address = models.TextField()
    phone_number = models.CharField(max_length=11, validators=[validate_phone_number])
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name="company_city", null=True, blank=True)
    area = models.ForeignKey(Area, on_delete=models.CASCADE, related_name="company_area", null=True, blank=True)

    def __str__(self):
        return self.company_name


class SubCompany(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    parent_company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='sub_companies')
    sub_company_name = models.CharField(max_length=255)
    manager = models.CharField(max_length=255,null=True)
    sub_company_address = models.TextField()
    phone_number = models.CharField(max_length=11, validators=[validate_phone_number])
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name="sub_company_city", null=True, blank=True)
    area = models.ForeignKey(Area, on_delete=models.CASCADE, related_name="sub_company_area", null=True, blank=True)

    def save(self, *args, **kwargs):
        # Inherit city and area from the parent company if not set
        if not self.city and self.parent_company:
            self.city = self.parent_company.city
        if not self.area and self.parent_company:
            self.area = self.parent_company.area
        super().save(*args, **kwargs)

    def __str__(self):
        return self.sub_company_name 

class Site(models.Model):
    id = models.CharField(
        primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company = models.ForeignKey(Company, null=True, blank=True, on_delete=models.CASCADE)
    sub_company = models.ForeignKey(SubCompany, null=True, blank=True, on_delete=models.CASCADE)
    site_name = models.CharField(max_length=255)
    manager = models.CharField(max_length=255,null=True)
    site_address = models.TextField()
    phone_number = models.CharField(max_length=11, validators=[validate_phone_number])
    location_url = models.URLField(max_length=200, null=True, blank=True)
    comment = models.TextField(null=True, blank=True)
    city = models.ForeignKey(City, on_delete=models.CASCADE, related_name="site_city", null=True, blank=True)
    area = models.ForeignKey(Area, on_delete=models.CASCADE, related_name="site_area", null=True, blank=True)
    
    def save(self, *args, **kwargs):
            # Inherit city and area from the company if not set
            if not self.city and self.company:
                self.city = self.company.city
            if not self.area and self.company:
                self.area = self.company.area
            super().save(*args, **kwargs)

    
    def __str__(self):
        return self.site_name
    



