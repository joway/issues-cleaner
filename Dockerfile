FROM joway/django-mysql-nginx:latest
ENV TZ Asia/Shanghai

WORKDIR /code

COPY ./requirements.txt /code/
RUN pip install -r ./requirements.txt

COPY ./.deploy/nginx.conf /etc/nginx/sites-enabled/default
COPY . /code

RUN python manage.py collectstatic --noinput

EXPOSE 8000 80

ENTRYPOINT ./entrypoint.sh
