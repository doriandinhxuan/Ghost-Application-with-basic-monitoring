#!/bin/bash

username='root'
password='ghost'

mysql -h 127.0.0.1 -P 3306 -u $username --password=$password ghost -e "UPDATE migrations_lock set locked=0 where lock_key='km01';"

exit

docker restart $(docker ps -aqf "name=ghostapp")