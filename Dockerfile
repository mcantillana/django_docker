FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1

RUN apk add --update \
    python \
    python-dev \
    gcc \
    py-pip \
    build-base \
    mariadb-dev \
    wget \
    libxslt-dev \
    xmlsec-dev 


RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/

# Install requirements
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ADD . /code/

EXPOSE 3000
CMD gunicorn -b 0:8000 main.wsgi
