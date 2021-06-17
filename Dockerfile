FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code2 
COPY Pipfile Pipfile.lock /code2/
RUN pip install pipenv && pipenv install --system 

COPY . /code2/