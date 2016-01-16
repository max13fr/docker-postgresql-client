# Docker : postgresql-client 9.5

Postgresql-client with an auto-connection to a postgresql database under docker. Improve also psql client (default .psqlrc, vim & less packages).

## Usage

Link your postgres container to database name (allow the autoconnection) :

<pre>
docker run -it --rm --link container_db_name:database postgresql-client:9.5
</pre>
