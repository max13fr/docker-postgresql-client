# Docker : postgresql-client 9.5

Postgresql-client with an auto-connection to a postgresql docker database.

Improve also psql command : 
* install vim & less packages
* add default .psqlrc
* add default .vimrc (for editing function \ef)

## Usage

Link your postgres container to database name (allow the autoconnection) :

<pre>
docker run -it --rm --link container_db_name:database postgresql-client:9.5
</pre>
