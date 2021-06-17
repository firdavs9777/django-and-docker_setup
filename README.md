# django-and-docker_setup
First check Dockerfile installation
It should be same as like this

FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code2 
COPY Pipfile Pipfile.lock /code2/
RUN pip install pipenv && pipenv install --system 

COPY . /code2/

Next step is:

docker build .

Successfully built ...

Then check docker-compose.yml
It should be same as below, please check identation and syntax errors as well

version: '3.7'
services: 
  web:
    build: .
    command: python /code2/manage.py runserver 0.0.0.0:8000
    volumes:
      - .:/code2 
    ports: 
      - "8000:8000"
      
     
Final step:
COMPOSE_HTTP_TIMEOUT=200 docker-compose up
Now go to http://127.0.0.0:8000/
