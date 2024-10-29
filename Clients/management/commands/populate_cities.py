from django.core.management.base import BaseCommand
from Clients.models import City, Area

egypt_cities_and_areas = {
    "Cairo": ["Nasr City", "Heliopolis", "Maadi", "Zamalek", "New Cairo", "Downtown", "Garden City", "Dokki"],
    "Alexandria": ["Montaza", "Smouha", "Sidi Gaber", "El Shatby", "El Raml", "Gleem", "Stanley", "Agamy"],
    "Giza": ["6th of October", "Sheikh Zayed", "Dokki", "Mohandessin", "Imbaba", "Pyramids", "Haram", "Faisal"],
    "Sharm El-Sheikh": ["Naama Bay", "Hadaba", "Sharks Bay", "Nabq Bay", "Old Market"],
    "Hurghada": ["Dahar", "Sakkala", "El Gouna", "Makadi Bay", "Sahl Hasheesh"],
    "Luxor": ["West Bank", "East Bank", "Karnak", "Al Mabadat", "Gezira", "Awameya"],
    "Aswan": ["Agilika Island", "Elephantine Island", "Nubian Village", "Sehel", "Gharb Aswan", "Abu Simbel"],
    "Mansoura": ["Talkha", "Al Mahalla", "Mansoura Qism 2", "Sakha", "Gammaleya"],
    "Ismailia": ["Fayed", "El Qantara", "Al Tayaran", "El Sheikh Zayed", "El Mostashfa El Askary"],
    "Port Said": ["El Arab District", "Port Fouad", "El Manakh", "El Zohour", "Sharq"],
    "Suez": ["Ain Sokhna", "El Ganayen", "Al Salam", "Al Arbaeen", "Faisal", "Port Tawfiq"],
    "Tanta": ["El Mehalla El Kobra", "El Santa", "Basyoun", "Kafr El Zayat", "Qotour"],
    "Zagazig": ["Fakous", "Kafr Saqr", "Abu Hammad", "Bilbeis", "Hihya", "Diarb Negm"],
    "Damanhur": ["Delengat", "Shubra Khit", "Itay El Baroud", "Kom Hamada", "Abu Hummus"],
    "Fayoum": ["Ibshaway", "Tamiya", "Youssef El Seddik", "Senoris", "New Fayoum"],
    "Beni Suef": ["Al Fashn", "Ehnasia", "Biba", "Sumusta", "Nasser City"],
    "Minya": ["Maghagha", "Samalut", "Abu Qirqas", "Malawi", "Deir Mawas"],
    "Sohag": ["Tahta", "Gerga", "Akhmim", "El Maragha", "Dar El Salam", "Tima"],
    "Assiut": ["Abnoub", "Abu Tig", "Manfalut", "Dairut", "El Badari", "Sahel Selim"],
    "Qena": ["Qift", "Qus", "Nag Hammadi", "Farshut", "El Waqf", "Abu Tesht"],
    "Al Arish": ["Sheikh Zuweid", "Rafah", "Bir El Abd", "El Mahdiya", "Masaeed"],
    "Marsaa Matrouh": ["El Alamein", "Sidi Abdel Rahman", "Siwa", "El Obayed", "Agiba"],
    "Damietta": ["Ras El Bar", "New Damietta", "Kafr Saad", "Faraskur", "Ezbet El Borg"],
    "Qalyubia": ["Banha", "Shubra El Kheima", "El Qanater", "Khanka", "Toukh", "Qaha"],
    "Beheira": ["Kafr El Dawwar", "Damanhour", "Rashid", "Abu Hummus", "Edku"],
    "Sharqia": ["Zagazig", "Bilbeis", "Fakous", "Abu Hammad", "El Husseiniya"],
    "Kafr El Sheikh": ["Baltim", "Desouk", "Fouh", "Sidi Salem", "Biyala", "El Riyad"],
    "Gharbia": ["El Mahalla", "Samanoud", "Zefta", "Kafr El Zayat", "Basyoun", "Santa"],
}


class Command(BaseCommand):
    help = 'Populates the database with cities and areas of Egypt'

    def handle(self, *args, **kwargs):
        self.populate_cities_and_areas()

    def populate_cities_and_areas(self):
        for city_name, areas in egypt_cities_and_areas.items():
            city, created = City.objects.get_or_create(name=city_name)
            for area_name in areas:
                Area.objects.get_or_create(name=area_name, city=city)

        self.stdout.write(self.style.SUCCESS('Cities and areas successfully saved to the database.'))
