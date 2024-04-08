FROM php:8.3-apache
RUN apt update && apt install -y zlib1g-dev libpng-dev
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
RUN docker-php-ext-install gd
RUN docker-php-ext-install exif
