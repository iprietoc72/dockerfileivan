FROM centos:7
MAINTAINER ivan  ivan.prieto@devoteam.com

USER root
WORKDIR /root
ENV IVAN-ENV="Variable Entorno Iván"  \
    IVAN-ENV1="Variable de entorno Iván 1"
LABEL campo_metadata_ivan1="docker con httpd ivan"  campo_metadata_ivan2="campo metadata2 del docker httpd ivan"
RUN  yum install -y httpd && \
     yum install -y mod_ssl

COPY index.html /var/www/html
ADD index1.tar /var/www/html

RUN chown apache:apache /var/www/html/index.html && chown apache:apache /var/www/html/index1.html 


RUN groupadd -g 6333 grpdocker  && useradd ivan -u 6333 -m -s /bin/bash -G grpdocker

RUN mkdir /myvolumen-ivan
RUN chown ivan:ivan /myvolumen-ivan

USER root

EXPOSE 80
VOLUME ["/myvolumen"]

#ENTRYPOINT ["/run/httpd"]
CMD     ["/usr/sbin/httpd","-D","FOREGROUND"]

