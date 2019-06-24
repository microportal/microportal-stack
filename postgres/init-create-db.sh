#!/usr/bin/env sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER keycloak WITH ENCRYPTED PASSWORD 'keycloak';
    CREATE DATABASE keycloak;
    GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;

    CREATE USER microportalsec WITH ENCRYPTED PASSWORD 'microportalsec';
    CREATE DATABASE microportalsec;
    GRANT ALL PRIVILEGES ON DATABASE microportalsec TO microportalsec;

    CREATE USER microportalmenu WITH ENCRYPTED PASSWORD 'microportalmenu';
    CREATE DATABASE microportalmenu;
    GRANT ALL PRIVILEGES ON DATABASE microportalmenu TO microportalmenu;
EOSQL
