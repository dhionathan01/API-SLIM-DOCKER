FROM php:7-apache

WORKDIR /var/www/html

# Instale dependências
RUN apt-get update \
    && apt-get install -y unzip

# Instale o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copie o arquivo composer.json para o contêiner
COPY composer.json .

# Instale as dependências do Composer
RUN composer install

# Verifique a instalação do Composer
RUN composer --version

CMD ["apache2-foreground"]
