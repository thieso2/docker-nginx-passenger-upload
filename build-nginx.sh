#!/bin/bash -x

./configure --with-cc-opt="`dpkg-buildflags --get CFLAGS`" \
	--with-ld-opt="`dpkg-buildflags --get LDFLAGS`" \
	--prefix=/usr/share/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--http-log-path=/var/log/nginx/access.log \
	--error-log-path=/var/log/nginx/error.log \
	--lock-path=/var/lock/nginx.lock \
	--pid-path=/run/nginx.pid \
	--http-client-body-temp-path=/var/lib/nginx/body \
	--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
	--http-proxy-temp-path=/var/lib/nginx/proxy \
	--http-scgi-temp-path=/var/lib/nginx/scgi \
	--http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
	--with-debug \
	--with-pcre-jit \
	--with-ipv6 \
	--with-http_ssl_module \
	--with-http_stub_status_module \
	--with-http_realip_module \
	--with-http_realip_module \
    --add-module=../nginx-upload-module-master




