FROM python:3.9-slim

# Set environment variables to prevent interactive prompts during apt-get installs
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory in the container
WORKDIR /ContractSystem

# Install system dependencies, including pkg-config
RUN apt-get update && apt-get install -y \
    libpq-dev \
    build-essential \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt /ContractSystem/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /ContractSystem

# Expose the port that Django will run on
EXPOSE 8000

# Command to run the Django application (using Gunicorn for production)
CMD ["gunicorn", "ContractSystem.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "2"]
