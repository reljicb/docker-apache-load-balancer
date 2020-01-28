#!/bin/bash

docker run --rm -dit \
        --name=httpd \
        -p 443:443 \
        -v $(pwd):/usr/local/apache2/htdocs \
        -v $(pwd)/httpd.conf:/usr/local/apache2/conf/httpd.conf \
        -v $(pwd)/httpd-vhosts.conf:/usr/local/apache2/conf/extra/httpd-vhosts.conf \
        -v $(pwd)/ssl/proxy-1.certificate.pem:"/usr/local/apache2/conf/ssl/proxy.certificate.pem" \
        -v $(pwd)/ssl/proxy-1.key.pem:"/usr/local/apache2/conf/ssl/proxy.key.pem" \
        -v $(pwd)/ssl/cacerts.pem:"/usr/local/apache2/conf/ssl/cacerts.pem" \
        httpd:2.4
