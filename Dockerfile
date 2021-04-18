FROM python:3.9-alpine
MAINTAINER DIMA

ENV PYTHONUNBUFFERED 1

WORKDIR /postgres

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps


RUN adduser -D user
USER user
