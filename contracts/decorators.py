from django.shortcuts import redirect
from django.http import HttpResponseForbidden
from functools import wraps

def redirect_authenticated_user(view_func):
    @wraps(view_func)
    def wrapper(request, *args, **kwargs):
        if request.user.is_authenticated:
            return redirect('dashboard')  # Redirect to dashboard if the user is logged in
        return view_func(request, *args, **kwargs)
    return wrapper



def allowed_users(allowed_roles=[]):
    def decorator(view_func):
        def wrapper_func(request, *args, **kwargs):
            group = None
            if request.user.groups.exists():
                group = request.user.groups.all()[0].name
            if group in allowed_roles:
                return view_func(request, *args, **kwargs)
            else:
                return HttpResponseForbidden("You are not authenticated.")
        return wrapper_func
    return decorator