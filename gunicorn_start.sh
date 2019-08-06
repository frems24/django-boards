#!/bin/bash

NAME="django_boards"
DIR=/home/wg/boards
USER=wg
GROUP=wg
WORKERS=3
BIND=unix:/home/wg/boards/run/gunicorn.socket
DJANGO_SETTINGS_MODULE=project.settings
DJANGO_WSGI_MODULE=project.wsgi
LOG_LEVEL=error

cd ${DIR}
source /home/wg/.local/share/virtualenvs/boards-o-M7WUJG/bin/activate

export DJANGO_SETTINGS_MODULE=${DJANGO_SETTINGS_MODULE}
export PYTHONPATH=${DIR}:${PYTHONPATH}

exec gunicorn ${DJANGO_WSGI_MODULE}:application \
    --name ${NAME} \
    --workers ${WORKERS} \
    --user=${USER} \
    --group=${GROUP} \
    --bind=${BIND} \
    --log-level=${LOG_LEVEL} \
    --log-file=-
