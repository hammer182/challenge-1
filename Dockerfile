#Download official python image from Docker HUB. Using 3.7 alpine version here
FROM python:3.7-alpine

#Set workdir
WORKDIR /code

#Environments variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SUPERUSER_EMAIL=hammer182@alura.teste
ENV DJANGO_SUPERUSER_USERNAME=hammer182
ENV DJANGO_SUPERUSER_PASSWORD=alurateste

#Install python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

#Copy application from workdir to container
COPY . .

#Generate database
RUN python manage.py migrate
#Create superuser using env variables with the --noinput option
RUN python manage.py createsuperuser --noinput

#Exposes port 3000
EXPOSE 3000

#Executes application
ENTRYPOINT ["python", "manage.py", "runserver", "0.0.0.0:3000"]