from rest_framework import serializers
from .models import Contract, MaintenanceSchedule, InvoiceSchedule

class ContractSerializer(serializers.ModelSerializer):
    class Meta:
        model = Contract
        fields = '__all__'

class MaintenanceScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = MaintenanceSchedule
        fields = '__all__'
class InvoiceScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = InvoiceSchedule
        fields = '__all__'