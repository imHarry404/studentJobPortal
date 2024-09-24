# Use the official Python image as a base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Copy the requirements file (if any) and install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# RUN pip install django
# RUN pip install Pillow


# Copy the rest of the application code
COPY . /app/

# Open port 8000 to allow traffic
EXPOSE 8000

# Run database migrations and start the Django development server
CMD ["sh", "-c", "python manage.py runserver 0.0.0.0:8000"]
