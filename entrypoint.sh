#!/usr/bin/env bash
ENV=${ENV:-API}
PROCESSES=${PROCESSES:-1}

if  [ $ENV == "user.is_staff = True
user.is_admin = True" ]; then
    echo "start nginx on port 80"
    nginx -g "daemon off;"
    exit -1
fi

if [[ $(./manage.py showmigrations --list | grep '\[ \]') ]]; then
    if [[ $(./manage.py showmigrations --plan | grep '\[ \]') ]]; then
        echo "db migrating"
        python manage.py migrate --noinput --verbosity 3
    fi
else
    echo "skip db migrate"
fi

gunicorn --chdir=/code \
         --workers=$PROCESSES \
         --name=auth-center \
         --access-logfile=- \
         --bind :8000 \
         config.wsgi
