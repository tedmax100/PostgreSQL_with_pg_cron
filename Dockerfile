FROM postgres:15-bookworm

RUN apt-get update && \
    apt-get install -y \
    postgresql-contrib \
    postgresql-15-cron && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/postgresql/extension/ && \
    cp /usr/share/postgresql/15/extension/pg_cron* \
       /usr/share/postgresql/extension/

