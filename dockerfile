FROM php:8-apache

WORKDIR /var/www/html

# Instale dependências
RUN apt-get update \
    && apt-get install -y unzip

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["apache2-foreground"]
