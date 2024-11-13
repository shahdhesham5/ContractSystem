FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /ContractSystem

# Copy the requirements file into the container
COPY requirements.txt /ContractSystem/

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /ContractSystem

# Expose the port that Django will run on
EXPOSE 8000

# Command to run the Django development server (or use Gunicorn for production)
CMD ["gunicorn", "ContractSystem.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "2"]
