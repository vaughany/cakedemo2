#!/bin/bash

DB="cakedemo2"
FILE="$DB-$(whoami)-$(hostname).sql"

echo -e "\e[1mDumping database \e[36;21m$DB\e[39;1m into \e[36;21m$FILE\e[39;1m.\e[0m"

echo
mysqldump --add-drop-database --dump-date --compact -v --skip-extended-insert --user root -p --databases $DB > $FILE

echo
echo -e "\e[36;21m$FILE\e[39m details:"
ls -hl $FILE

echo
echo Done.
