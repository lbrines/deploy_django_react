FROM python:3.5
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install graphviz graphviz-dev postgresql-client -y && rm -rf /var/lib/apt/lists/*
RUN pip install psycopg2 && pip install psycopg2-binary
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
