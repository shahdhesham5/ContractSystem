FROM python:3.9-slim

# Set environment variables to prevent interactive prompts during apt-get installs
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory in the container
WORKDIR /ContractSystem

# Install system dependencies, including pkg-config
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    libpq-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

    RUN apt-get update && apt-get install -y nginx
# Copy the requirements file into the container
COPY requirements.txt /ContractSystem/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the 
COPY . /ContractSystem
#COPY /etc/nginx/sites-available/ictcoegyptstock /etc/nginx/nginx.conf

#COPY nginx.conf /etc/nginx/nginx.conf
# Expose the port that Django will run on
# EXPOSE 8000
EXPOSE 80 443

# Command to run the Django application (using Gunicorn for production)
# CMD ["gunicorn", "ContractSystem.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]
# Command to start both Gunicorn and Nginx
CMD ["sh", "-c", "service nginx start && gunicorn ContractSystem.wsgi:application --bind 0.0.0.0:8000 --workers 3"]

