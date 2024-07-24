FROM python:3.10-slim-buster

ARG BUILD_NUMBER

RUN echo "import os" >> /say_hello.py
RUN echo "print('Build Number: ${BUILD_NUMBER}')" >> /say_hello.py
RUN echo "print(os.getenv('WORDS'))" >> /say_hello.py

ENTRYPOINT python /say_hello.py