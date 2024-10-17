"""
URL configuration for ContractSystem project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views  # Import auth views
from .settings import  STATIC_URL, STATIC_ROOT, MEDIA_URL, MEDIA_ROOT
urlpatterns = (
    [
    path('', include('home.urls')),
    path('admin/', admin.site.urls),
    path('login/', auth_views.LoginView.as_view(template_name='accounts/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(next_page='accounts/login.html'), name='logout'),
    path("", include('admin_soft.urls')),
    path('clients/', include('Clients.urls')),
    path('contracts/', include('contracts.urls'))
    ]
    + static(STATIC_URL, document_root=STATIC_ROOT)
    + static(MEDIA_URL, document_root=MEDIA_ROOT)
)

admin.site.site_header = "Contracts Management System"
admin.site.index_title = "Contracts Management System"
