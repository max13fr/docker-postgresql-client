FROM debian:jessie

ENV PG_MAJOR 9.5

RUN apt-get update && apt-get install -y --no-install-recommends gnupg2 wget ca-certificates

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update \
    && apt-get install -y \
        postgresql-client-$PG_MAJOR \
        vim \
        less \
    && rm -rf /var/lib/apt/lists/*

COPY .vimrc /root/
COPY .psqlrc /root/

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["psql"]
