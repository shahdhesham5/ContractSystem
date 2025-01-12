from django.core.management.base import BaseCommand
from contracts.models import  InvoiceSchedule

class Command(BaseCommand):
    help = "Round all invoice amounts to the nearest two decimals."

    def handle(self, *args, **kwargs):
        invoices = InvoiceSchedule.objects.all()
        for invoice in invoices:
            if invoice.amount is not None:
                invoice.amount = round(invoice.amount, 2)
                invoice.save()
        self.stdout.write("Successfully updated all invoice amounts to the nearest two decimals.")
