FROM python:3.7.3

COPY ./ /var/www/
WORKDIR /var/www

RUN pip install -r requirements.txt && python manage.py makemigrations && python manage.py migrate

CMD gunicorn -c gunicorn.py main.wsgi
