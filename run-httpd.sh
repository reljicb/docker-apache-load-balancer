#!/bin/bash

docker run --rm -dit \
	--name=httpd \
	-p 8443:8443 \
	-v $(pwd):/usr/local/apache2/htdocs \
	-v $(pwd)/httpd.conf:/usr/local/apache2/conf/httpd.conf \
	-v $(pwd)/httpd-vhosts.conf:/usr/local/apache2/conf/extra/httpd-vhosts.conf \
	-v $(pwd)/ssl/:/usr/local/apache2/conf/ssl/ \
	httpd:2.4
