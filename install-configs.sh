#!/bin/sh
PHP_INI_FILE="/d/xampp/php/php.ini"
HTTPD_CONF_FILE="/d/xampp/apache/conf/httpd.conf"

# PHP memory
echo " -> Updating PHP configs..."

memory_limit=256M
post_max_size=32M
upload_max_filesize=32M
max_execution_time=5000

for key in memory_limit post_max_size upload_max_filesize max_execution_time
do
	sed -i "s/^\($key\).*/\1=$(eval echo \${$key})/" ${PHP_INI_FILE}
	echo "  - Successfully Updated $key=$(eval echo \${$key})"
done

# Virtual hosts
echo " -> Including Custom Virtual hosts..."
cat << 'EOL' >> ${HTTPD_CONF_FILE}

# Custom Virtual hosts
Include D:/htdocs/httpd-vhosts.conf

EOL
echo " -> All done..."
