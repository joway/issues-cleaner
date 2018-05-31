FROM python:3.6.3-slim
ENV TZ Asia/Shanghai

RUN apt update \
    && apt install -y build-essential \
    libmysqlclient-dev mysql-client \
    nginx libpcre3 libpcre3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /code

COPY ./requirements.txt /code/
RUN pip install -r ./requirements.txt

COPY ./.deploy/nginx.conf /etc/nginx/sites-enabled/default
COPY . /code

RUN python manage.py collectstatic --noinput

EXPOSE 8000 80

ENTRYPOINT ./entrypoint.sh
