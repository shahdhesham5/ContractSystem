from celery import shared_task
import logging
from django.utils.timezone import now
from .models import Contract


logger = logging.getLogger(__name__)

@shared_task
def renew_expired_contracts():
    logger.info("Running renew_expired_contracts task...")
    expired_contracts = Contract.objects.filter(auto_renew=True, renewed=False, end_date__lt=now().date())
    logger.info("renew_expired_contracts task...", expired_contracts)
    for contract in expired_contracts:
        logger.info(f"Renewing contract for company: {contract.company.company_name}")
        contract.auto_renew_contract()