from django.db import models
from Clients.models import Company, Site, SubCompany
import os
import uuid
from django.core.validators import MinValueValidator, MaxValueValidator
from django.core.exceptions import ValidationError
from django.core import validators
from django_resized import ResizedImageField
from dateutil.relativedelta import relativedelta
from datetime import timedelta

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
    
# path generators to upload images/files for contracts
def get_contract_image_upload_path(instance, filename):
    return os.path.join("contacts", instance.company.company_name, filename)

def get_contract_pdf_upload_path(instance, filename):
    return os.path.join("pdfs", instance.company.company_name, filename)

#path generators to upload images/files for maintenance visits 
def get_visit_image_upload_path(instance, filename):
    return os.path.join("maintenance-visits", instance.contract.company.company_name, filename)

def get_visit_pdf_upload_path(instance, filename):
    return os.path.join("maintenance-visits-pdfs", instance.contract.company.company_name, filename)

#path generators to upload images/files for invoices
def get_invoice_image_upload_path(instance, filename):
    return os.path.join("invoices", instance.contract.company.company_name, filename)

def get_invoice_pdf_upload_path(instance, filename):
    return os.path.join("invoices-pdfs", instance.contract.company.company_name, filename)

#path generators to upload images/files for invoices
def get_emergency_visit_image_upload_path(instance, filename):
    return os.path.join("emergency", instance.contract.company.company_name, filename)

def get_emergency_visit_pdf_upload_path(instance, filename):
    return os.path.join("emergency-pdfs", instance.contract.company.company_name, filename)



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

annual_increase_percentage = [
    (5, '5%'),
    (10, '10%'),
]
invoice_date_choices = [
    ('start', 'From the Start of the Frequency Period'),
    ('end', 'From the End of the Frequency Period'),
]
within_period =[
    (48, '48'),
    (72, '72'),
]
class Contract(models.Model):
    id = models.CharField(primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name="company_contract")
    
    start_date = models.DateField()
    end_date = models.DateField(null=True, blank=True)

    contract_price_value = models.FloatField(validators=[MinValueValidator(0.0)])
    annual_increase = models.IntegerField(choices=annual_increase_percentage,null=True,blank=True)  
    auto_renew = models.BooleanField(default=False)
    emergency_visit_price = models.FloatField(validators=[MinValueValidator(0.0)], default=0, null=True, blank=True)
    emergency_within_period = models.IntegerField(choices=within_period,null=True,blank=True)
    
    invoice_frequency = models.CharField(max_length=255, choices=intervals) 
    invoice_date_calculation = models.CharField(max_length=10, choices=invoice_date_choices, default='end')
    maintenance_frequency = models.CharField(max_length=255, choices=intervals)  
    
    branch = models.CharField(max_length=255, choices=branches)
    branch_site = models.CharField(max_length=255, choices=branches_site, default='Cairo')
    
    
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
    
    def save(self, *args, **kwargs):
        # If end_date is not set, calculate it from start_date (1 year minus 1 day)
        if not self.end_date and self.start_date:
            self.end_date = self.start_date + relativedelta(years=1) - timedelta(days=1)
        super(Contract, self).save(*args, **kwargs)
        
    def __str__(self):
        return f"{self.company}"

class Engineers(models.Model):
    name = models.CharField(max_length=255)
    
class MaintenanceSchedule(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name='schedules')
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    eng = models.ForeignKey(Engineers, on_delete=models.CASCADE, null=True, blank=True)
    
    visit_date = models.DateField()
    due_date = models.DateField(null=True, blank=True)
    completed_date = models.DateField(null=True, blank=True)
    done = models.BooleanField(default=False, null=True, blank=True)
    image = ResizedImageField(
        upload_to=get_visit_image_upload_path,
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
        upload_to=get_visit_pdf_upload_path,
        null=True,
        blank=True,
        validators=[
            validators.FileExtensionValidator(allowed_pdf_extensions, 
            f"Invalid file extension. Only the following formats are allowed: {', '.join(allowed_pdf_extensions)}."),
            pdf_file_size,
        ],
    )
    
    def complete_visit(self, completed_date):
        self.completed_date = completed_date
        if self.is_valid_visit():
            self.is_done = True
        else:
            self.is_done = False
        self.save()

    def is_valid_visit(self):
        return self.visit_date <= self.completed_date < self.due_date

    def __str__(self):
        return f"Schedule for {self.site} on {self.visit_date}"
    
class InvoiceSchedule(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name="invoices_Schedule")
    company = models.ForeignKey(Company, on_delete=models.CASCADE, null=True, blank=True)  # Add this field if missing
    sub_company = models.ForeignKey(SubCompany, on_delete=models.CASCADE, null=True, blank=True)
    invoice_date = models.DateField()
    amount = models.FloatField(validators=[MinValueValidator(0.0)])
    is_paid = models.BooleanField(default=False)
    image = ResizedImageField(
        upload_to=get_invoice_image_upload_path,
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
        upload_to=get_invoice_pdf_upload_path,
        null=True,
        blank=True,
        validators=[
            validators.FileExtensionValidator(allowed_pdf_extensions, 
            f"Invalid file extension. Only the following formats are allowed: {', '.join(allowed_pdf_extensions)}."),
            pdf_file_size,
        ],
    )


    def __str__(self):
        return f"Invoice for {self.contract.company.company_name} on {self.invoice_date}"

class EmergencyVisits(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name='emergency')
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    eng = models.ForeignKey(Engineers, on_delete=models.CASCADE, null=True, blank=True)
    
    request_visit_date = models.DateField()
    actual_visit_date = models.DateField(null=True, blank=True)
    done = models.BooleanField(default=False, null=True, blank=True)
    comment = models.TextField(null=True, blank=True)
    image = ResizedImageField(
        upload_to=get_emergency_visit_image_upload_path,
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
        upload_to=get_emergency_visit_pdf_upload_path,
        null=True,
        blank=True,
        validators=[
            validators.FileExtensionValidator(allowed_pdf_extensions, 
            f"Invalid file extension. Only the following formats are allowed: {', '.join(allowed_pdf_extensions)}."),
            pdf_file_size,
        ],
    )
    
    def __str__(self):
        return f"Schedule for {self.site} on {self.request_visit_date}"
    
