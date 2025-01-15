from __future__ import absolute_import, unicode_literals
import os
from celery import Celery
from celery.schedules import crontab

# Set default Django settings module for 'celery'
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ContractSystem.settings')

app = Celery('ContractSystem')
app.config_from_object('django.conf:settings', namespace='CELERY')
app.autodiscover_tasks()

app.conf.beat_schedule = {
    "check-expired-contracts-daily": {
        "task": "contracts.tasks.renew_expired_contracts",
        # "schedule": crontab(minute="*"),
        "schedule": crontab(hour=0, minute=0),
    },
}
# Automatically discover tasks in your installed apps

@app.task(bind=True)
def debug_task(self):
    print(f'Request: {self.request!r}')
