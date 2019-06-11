FROM python:3.7.3

COPY ./ /var/www/
WORKDIR /var/www

RUN pip install -r requirements.txt
