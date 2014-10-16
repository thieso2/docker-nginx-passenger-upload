Usage:

 docker build -t docker-nginx-passenger-upload . && docker run --rm -v `pwd`/target:/target docker-nginx-passenger-upload

after running you'll find "target/nginx-passenger-upload-stripped.tar.bz2" and "target/nginx-passenger-upload.tar.bz2" both just contain
a singe file "usr/sbin/nginx" which should be a dropin replacement for you Ubuntu 14.04 usr/sbin/nginx with passenger and 
upload-support.
