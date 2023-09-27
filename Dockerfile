# Use uma imagem base com PHP e Apache
FROM php:7.4-apache

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Configure o Apache
RUN a2enmod rewrite
RUN service apache2 restart

RUN chmod -R 777 /var/www/html

# Comando para iniciar o Apache (você pode personalizar isso conforme necessário)
CMD ["apache2-foreground"]
