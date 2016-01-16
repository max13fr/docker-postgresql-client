FROM debian:jessie

ENV PG_MAJOR 9.5

RUN apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

RUN apt-get update \
    && apt-get install -y \
        postgresql-client-$PG_MAJOR \
        vim \
        less \
    && rm -rf /var/lib/apt/lists/*

COPY .vimrc /root
COPY .psqlrc /root

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["psql"]
