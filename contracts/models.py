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
from django.utils.translation import gettext_lazy as _
from threading import local
from django.utils import timezone 
# extension validations
allowed_image_extensions = ['jpg', 'png', 'jpeg', 'gif', 'svg']
allowed_pdf_extensions = ['pdf']

def pdf_file_size(value):
    limit = 10 * 1024 * 1024  # 10 MB limit
    if not value.name.endswith('.pdf'):
        raise ValidationError(_('Only PDF files are allowed.'))
    if value.size > limit:
        raise ValidationError(_('File too large. Size should not exceed 10 MB.'))

def image_file_size(value):
    limit = 5 * 1024 * 1000
    if value.size > limit:
        raise ValidationError(_('File too large. Size should not exceed 5 MiB.'))
    
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



visit_intervals= [
    ("Every Week", _("Every Week")),           # 52 visits/Y
    ("Every 2 Weeks", _("Every 2 Weeks")),     # 26 visits/Y
    ("Every Month",_("Every Month")),         #12 visits/Y
    ("Every 2 Months",_("Every 2 Months")),   #6  visits/Y 
    ("Every 3 Months",_("Every 3 Months")),   #4  visits/Y
    ("Every 4 Months",_("Every 4 Months")),   #3  visits/Y
    ("Every 6 Months",_("Every 6 Months")),   #2  visits/Y
]
invoice_intervals= [
    ("Every Month",_("Every Month")),         #12 visits/Y
    ("Every 2 Months",_("Every 2 Months")),   #6  visits/Y 
    ("Every 3 Months",_("Every 3 Months")),   #4  visits/Y
    ("Every 4 Months",_("Every 4 Months")),   #3  visits/Y
    ("Every 6 Months",_("Every 6 Months")),   #2  visits/Y
]
branches=[
    ("International company",_("International company")),
    ("Millenium company",_("Millenium company")),
]
branches_site=[
    ("Cairo",_("Cairo")),
    ("Alexandria",_("Alexandria")),
]

annual_increase_percentage = [
    (5, '5%'),
    (7, '7%'),
    (10, '10%'),
]
invoice_date_choices = [
    ('start', _('From the Start of the Frequency Period')),
    ('end', _('From the End of the Frequency Period')),
]
within_period =[
    (48, '48'),
    (72, '72'),
]
class Contract(models.Model):
    id = models.CharField(primary_key=True, default=uuid.uuid4, editable=False, max_length=255)
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name="company_contract",verbose_name=_("Company Name"))
    
    start_date = models.DateField(verbose_name=_("Start Date"))
    end_date = models.DateField(null=True, blank=True,verbose_name=_("End Date"))

    contract_price_value = models.FloatField(validators=[MinValueValidator(0.0)],verbose_name=_("Contract Price Value"))
    annual_increase = models.IntegerField(choices=annual_increase_percentage,null=True,blank=True,verbose_name=_("Annual Percentage"))  
    auto_renew = models.BooleanField(default=False,verbose_name=_("Auto Renew"))
    emergency_visit_price = models.FloatField(validators=[MinValueValidator(0.0)], default=0, null=True, blank=True,verbose_name=_("Emergency Visit Price"))
    emergency_within_period = models.IntegerField(choices=within_period,null=True,blank=True,verbose_name=_("Emergency Visit within"))
    
    invoice_frequency = models.CharField(max_length=255, choices=invoice_intervals,verbose_name=_("Invoice Frequency")) 
    invoice_date_calculation = models.CharField(max_length=10, choices=invoice_date_choices, default='end',verbose_name=_("Invoice Calculated Date"))
    maintenance_frequency = models.CharField(max_length=255, choices=visit_intervals,verbose_name=_("Maintenance Frequency"))  
    
    branch = models.CharField(max_length=255, choices=branches,verbose_name=_("Company"))
    branch_site = models.CharField(max_length=255, choices=branches_site, default='Cairo',verbose_name=_("Company Branch"))
    
    
    damgh_date = models.DateField(null=True, blank=True,verbose_name=_("Damgh Date"))
    damgh_price = models.FloatField(validators=[MinValueValidator(0.0)], default=0, null=True, blank=True,verbose_name=_("Damgh Price"))
    
    is_taxed = models.BooleanField(default=False, verbose_name=_("Is Taxed"))  # New Field
    tax_percentage = models.FloatField(default=14.0, validators=[MinValueValidator(0.0), MaxValueValidator(100.0)], verbose_name=_("Tax Percentage"))  # Optional field for dynamic tax rates

    image = ResizedImageField(
        upload_to=get_contract_image_upload_path,
        null=True,
        verbose_name=_("Contract Image"),
        blank=True,
        validators=[
            validators.FileExtensionValidator(
                allowed_image_extensions,
            _("Invalid image extension. Only the following formats are allowed: {}.").format(', '.join(allowed_image_extensions))            ),
            image_file_size,
        ],
    )
    pdf = models.FileField(
        upload_to=get_contract_pdf_upload_path,
        null=True,
        verbose_name=_("Contract PDF"),
        blank=True,
        validators=[
            validators.FileExtensionValidator(
            allowed_pdf_extensions, 
            _("Invalid file extension. Only the following formats are allowed: {}.").format(', '.join(allowed_pdf_extensions))),
            pdf_file_size,
        ],
    )
    _local = local()
    
    renewed = models.BooleanField(default=False, verbose_name=_("Renewed"))
    
    
    @property
    def skip_update(self):
        return getattr(self._local, "skip_update", False)

    @skip_update.setter
    def skip_update(self, value):
        self._local.skip_update = value

    def save(self, *args, **kwargs):
        # If end_date is not set, calculate it from start_date (1 year minus 1 day)
        if not self.end_date and self.start_date:
            self.end_date = self.start_date + relativedelta(years=1) - timedelta(days=1)
        super(Contract, self).save(*args, **kwargs)
    
    def auto_renew_contract(self):
        if self.auto_renew and self.annual_increase and self.end_date < timezone.now().date():
            if self.renewed:  # Skip if already renewed
                return None
            new_start_date = self.end_date + timedelta(days=1)
            new_end_date = new_start_date + relativedelta(years=1) - timedelta(days=1)
            new_contract_price_value = self.contract_price_value * (1 + (self.annual_increase / 100))

            # Create the new contract
            new_contract = Contract.objects.create(
                company=self.company,
                start_date=new_start_date,
                end_date=new_end_date,
                contract_price_value=new_contract_price_value,
                annual_increase=self.annual_increase,
                auto_renew=self.auto_renew,
                emergency_visit_price=self.emergency_visit_price,
                emergency_within_period=self.emergency_within_period,
                invoice_frequency=self.invoice_frequency,
                invoice_date_calculation=self.invoice_date_calculation,
                maintenance_frequency=self.maintenance_frequency,
                branch=self.branch,
                branch_site=self.branch_site,
                damgh_date=self.damgh_date,
                damgh_price=self.damgh_price,
                is_taxed=self.is_taxed,
                tax_percentage=self.tax_percentage,
                image=self.image,
                pdf=self.pdf,
            )
            # Mark the original contract as renewed
            self.renewed = True
            self.save()
            # Trigger the signals for generating invoices for the new contract
            return new_contract
        return None
    
    def __str__(self):
        return f"{self.company}"


class Engineers(models.Model):
    name = models.CharField(max_length=255,verbose_name=_("Engineer name"))
    def __str__(self):
        return f"{self.name}"

    
class MaintenanceSchedule(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name='schedules',verbose_name=_("Company Name"))
    site = models.ForeignKey(Site, on_delete=models.CASCADE,verbose_name=_("Site"))
    eng = models.ForeignKey(Engineers, on_delete=models.CASCADE, null=True, blank=True,verbose_name=_("Engineer name"))
    
    visit_date = models.DateField(verbose_name=_("Visit date"))
    due_date = models.DateField(null=True, blank=True,verbose_name=_("Visit Due date"))
    completed_date = models.DateField(null=True, blank=True,verbose_name=_("Visit Completed date"))
    done = models.BooleanField(default=False, null=True, blank=True,verbose_name=_("Done"))
    image = ResizedImageField(
        upload_to=get_visit_image_upload_path,
        null=True,
        blank=True,
        verbose_name=_("Visit Image"),
        validators=[
            validators.FileExtensionValidator(
                allowed_image_extensions,
            _("Invalid image extension. Only the following formats are allowed: {}.").format(', '.join(allowed_image_extensions))            ),
            image_file_size,
        ],
    )
    pdf = models.FileField(
        upload_to=get_visit_pdf_upload_path,
        null=True,
        verbose_name=_("Visit PDF"),
        blank=True,
        validators=[
            validators.FileExtensionValidator(
            allowed_pdf_extensions, 
            _("Invalid file extension. Only the following formats are allowed: {}.").format(', '.join(allowed_pdf_extensions))),
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
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name="invoices_Schedule",verbose_name=_("Company Name"))
    company = models.ForeignKey(Company, on_delete=models.CASCADE, null=True, blank=True,verbose_name=_("Company Name"))  
    sub_company = models.ForeignKey(SubCompany, on_delete=models.CASCADE, null=True, blank=True,verbose_name=_("Sub Company Name"))
    invoice_date = models.DateField(verbose_name=_("Invoice date"))
    amount = models.FloatField(validators=[MinValueValidator(0.0)],verbose_name=_("Invoice value"))
    is_paid = models.BooleanField(default=False,verbose_name=_("Is paid"))
    image = ResizedImageField(
        upload_to=get_invoice_image_upload_path,
        null=True,
        verbose_name=_("Invoice Image"),
        blank=True,
        validators=[
            validators.FileExtensionValidator(
                allowed_image_extensions,
            _("Invalid image extension. Only the following formats are allowed: {}.").format(', '.join(allowed_image_extensions))            ),
            image_file_size,
        ],
    )
    pdf = models.FileField(
        upload_to=get_invoice_pdf_upload_path,
        null=True,
        verbose_name=_("Invoice PDF"),
        blank=True,
        validators=[
            validators.FileExtensionValidator(
            allowed_pdf_extensions, 
            _("Invalid file extension. Only the following formats are allowed: {}.").format(', '.join(allowed_pdf_extensions))),
            pdf_file_size,
        ],
    )

    def save(self, *args, **kwargs):
            # Round the amount to 2 decimal places
            if self.amount is not None:
                self.amount = round(self.amount, 2)
            super(InvoiceSchedule, self).save(*args, **kwargs)

    def __str__(self):
        return f"Invoice for {self.contract.company.company_name} on {self.invoice_date}"

class EmergencyVisits(models.Model):
    contract = models.ForeignKey(Contract, on_delete=models.CASCADE, related_name='emergency')
    site = models.ForeignKey(Site, on_delete=models.CASCADE)
    eng = models.ForeignKey(Engineers, on_delete=models.CASCADE, null=True, blank=True)
    
    request_visit_date = models.DateField(verbose_name=_("Emergency Visit Request date"))
    actual_visit_date = models.DateField(null=True, blank=True,verbose_name=_("Emergency Visit date"))
    price = models.FloatField(validators=[MinValueValidator(0.0)], default=0, null=True, blank=True,verbose_name=_("Price"))
    done = models.BooleanField(default=False, null=True, blank=True,verbose_name=_("Done"))
    comment = models.TextField(null=True, blank=True,verbose_name=_("Comment"))
    image = ResizedImageField(
        upload_to=get_emergency_visit_image_upload_path,
        null=True,
        blank=True,
        verbose_name=_("Emergency Visit Image"),
        validators=[
            validators.FileExtensionValidator(
                allowed_image_extensions,
            _("Invalid image extension. Only the following formats are allowed: {}.").format(', '.join(allowed_image_extensions))            ),
            image_file_size,
        ],
    )
    pdf = models.FileField(
        upload_to=get_emergency_visit_pdf_upload_path,
        null=True,
        verbose_name=_("Emergency Visit PDF"),
        blank=True,
        validators=[
            validators.FileExtensionValidator(
            allowed_pdf_extensions, 
            _("Invalid file extension. Only the following formats are allowed: {}.").format(', '.join(allowed_pdf_extensions))),
            pdf_file_size,
        ],
    )
    def save(self, *args, **kwargs):
        # Inherit city and area from the parent company if not set
        if not self.price:
            self.price = self.contract.emergency_visit_price
        super().save(*args, **kwargs)
        
    def clean(self):
        super().clean()  # Call the parent's clean method
        if not self.price and self.contract.emergency_visit_price is None:
            raise ValidationError("Price is required. Please Enter the price.")

    def __str__(self):
        return f"Schedule for {self.site} on {self.request_visit_date}"
    


class Vehicles(models.Model):
    num_vehicles = models.PositiveIntegerField(default=1, verbose_name="Number of Vehicles")
    vehicle_capacity = models.PositiveIntegerField(default=2, verbose_name="Vehicle Capacity")
    depot = models.URLField(max_length=200, null=True, blank=True, verbose_name=_("Depot Location"))