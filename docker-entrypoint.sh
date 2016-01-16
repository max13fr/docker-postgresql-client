#!/bin/bash
set -e

if [ "$1" = 'psql' ]; then
    PGPASSWORD=$DATABASE_ENV_POSTGRES_PASSWORD psql -h database -U $DATABASE_ENV_POSTGRES_USER -w $DATABASE_ENV_POSTGRES_DB
else
    exec "$@"
fi
