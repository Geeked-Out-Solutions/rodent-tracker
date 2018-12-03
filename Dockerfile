FROM python:3.7-slim

RUN mkdir /app
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN pip install --editable .

LABEL maintainer="Brian Hopkins <btotharye@gmail.com>"

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "flaskstarter.app:create_app()"
