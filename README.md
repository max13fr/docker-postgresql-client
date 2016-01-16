# Docker : psql 9.5

Postgresql-client with an auto-connection to a postgresql docker database.

Improve also cli : 
* install vim & less packages
* add default .psqlrc
* add default .vimrc (for editing function \ef)

## Usage

Just need to link your postgres db container with the name 'database' to allow the autoconnection :

<pre>
docker run -it --rm --link container_db_name:database max13fr/psql
</pre>
