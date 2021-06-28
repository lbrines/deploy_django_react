#!/bin/sh

set -e
  
host="$1"
shift
  
until PGPASSWORD=$DB_PASS psql -h $host -U "postgres" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
python manage.py migrate
python manage.py runserver 0.0.0.0:8000