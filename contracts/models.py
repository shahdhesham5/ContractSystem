from django.db import models
from Clients.models import Company, Site
import os
import uuid
from django.core.validators import MinValueValidator, MaxValueValidator
from django.core.exceptions import ValidationError
from django.core import validators
from django_resized import ResizedImageField


# extension validations
allowed_image_extensions = ['jpg', 'png', 'jpeg', 'gif', 'svg']
allowed_pdf_extensions = ['pdf']

# Validator to limit file size 
def pdf_file_size(value):
    limit = 10 * 1024 * 1024  # 10 MB limit
    if value.size > limit:
        raise ValidationError('File too large. Size should not exceed 10 MB.')

def image_file_size(value):
    limit = 5 * 1024 * 1000
    if value.size > limit:
        raise ValidationError('File too large. Size should not exceed 5 MiB.')
    
# path generators to upload images/files
def get_contract_image_upload_path(instance, filename):
    return os.path.join("contacts", instance.company.company_name, filename)

def get_contract_pdf_upload_path(instance, filename):
    return os.path.join("pdfs", instance.company.company_name, filename)


intervals= [
    ("Every Month","Every Month"),         #12 visits/Y
    ("Every 2 Months","Every 2 Months"),   #6  visits/Y 
    ("Every 3 Months","Every 3 Months"),   #4  visits/Y
    ("Every 4 Months","Every 4 Months"),   #3  visits/Y
    ("Every 6 Months","Every 6 Months"),   #2  visits/Y
]

branches=[
    ("International company","International company"),
    ("Millenium company","Millenium company"),
]
branches_site=[
    ("Cairo","Cairo"),
    ("Alexandria","Alexandria"),
]


class Contract(models.Model):
    id = models.CharField(primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name="company_contract")
    
    start_date = models.DateField()
    end_date = models.DateField()

    contract_price_value = models.FloatField(validators=[MinValueValidator(0.0)])
    emergency_visit_price = models.FloatField(validators=[MinValueValidator(0.0)], default=0, null=True, blank=True)
    annual_increase = models.FloatField(
        validators=[MinValueValidator(0.0), MaxValueValidator(100.0)],
        null=True,
        blank=True
    )  
    
    invoice_frequency = models.CharField(max_length=255, choices=intervals)  # e.g., monthly, every 2 months
    maintenance_frequency = models.CharField(max_length=255, choices=intervals)  # e.g., monthly, every 2 months
    branch = models.CharField(max_length=255, choices=branches)
    branch_site = models.CharField(max_length=255, choices=branches_site, default='Cairo')
    
    auto_renew = models.BooleanField(default=False)
    damgh_date = models.DateField(null=True, blank=True)
    damgh_price = models.FloatField(validators=[MinValueValidator(0.0)], default=0, null=True, blank=True)
    image = ResizedImageField(
        upload_to=get_contract_image_upload_path,
        null=True,
        blank=True,
        validators=[
            validators.FileExtensionValidator(
                allowed_image_extensions,
                f"Invalid image extension. Only the following formats are allowed: {', '.join(allowed_image_extensions)}."
            ),
            image_file_size,
        ],
    )
    pdf = models.FileField(
        upload_to=get_contract_pdf_upload_path,
        null=True,
        blank=True,
        validators=[
            validators.FileExtensionValidator(allowed_pdf_extensions, 
            f"Invalid file extension. Only the following formats are allowed: {', '.join(allowed_pdf_extensions)}."),
            pdf_file_size,
        ],
    )
    
    def __str__(self):
        return f"{self.company}"

class MaintenanceSchedule(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name='schedules')
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    visit_date = models.DateField()

    def __str__(self):
        return f"Schedule for {self.site} on {self.visit_date}"
