FROM python:3.10-slim-buster

USER root

WORKDIR /src

COPY requirements.txt requirements.txt

# Dependencies required for psycopg2 (used for Postgres client)
RUN apt update -y && apt install -y build-essential libpq-dev

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY . .

# ARG DB_USERNAME=root
# ARG DB_PASSWORD=root
# ARG DB_HOST=127.0.0.1
# ARG DB_PORT=5432
# ARG DB_NAME=first-db

CMD python app.py
