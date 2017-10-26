#!/usr/bin/env bash
memory_limit=256M
post_max_size=32M
upload_max_filesize=32M
max_execution_time=5000

for key in memory_limit post_max_size upload_max_filesize max_execution_time
do
	sed -i "s/^\($key\).*/\1=$(eval echo \${$key})/" '/c/xampp/php/php.ini'
done
