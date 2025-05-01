FROM php:8.2-fpm

# Instala extensões do PHP necessárias para Symfony
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libicu-dev \
    libzip-dev \
    && docker-php-ext-install \
    intl \
    opcache \
    pdo_mysql \
    zip

# Composer global
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Ajuste de permissões, diretório de trabalho
WORKDIR /var/www/html
RUN usermod -u 1000 www-data

# Copia php.ini customizado (opcional)
# COPY php.ini /usr/local/etc/php/php.ini
