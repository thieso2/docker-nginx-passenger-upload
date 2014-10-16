FROM phusion/passenger-ruby21:0.9.14
MAINTAINER Thies C. Arntzen <thieso@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
#ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget

RUN apt-get build-dep -y nginx

RUN wget --quiet https://github.com/cloudvm/nginx-upload-module/archive/master.tar.gz && tar xvfz master.tar.gz
RUN wget --quiet http://nginx.org/download/nginx-1.7.6.tar.gz && tar xvfz nginx-1.7.6.tar.gz
ADD build-nginx.sh /nginx-1.7.6/build-nginx.sh
RUN cd /nginx-1.7.6 && ./build-nginx.sh && make
RUN cp /nginx-1.7.6/objs/nginx /usr/sbin/nginx && tar cvfj /nginx-passenger-upload.tar.bz2 /usr/sbin/nginx
RUN strip /usr/sbin/nginx && tar cvfj /nginx-passenger-upload-stripped.tar.bz2 /usr/sbin/nginx
ADD copy_nginx.sh /copy_nginx.sh
CMD /copy_nginx.sh
