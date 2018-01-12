# php5.3用の設定
# ビルドコマンド
# docker build -t ubuntu:php53 .

FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install -y php5 php5-mysql php5-gd php5-mcrypt php5-curl php-apc
RUN apt-get install -y php-pear --fix-missing
RUN apt-get install -y imagemagick
RUN a2enmod rewrite

COPY default /etc/apache2/sites-available

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV CAKE_ENV development

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
