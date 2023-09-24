# Use uma imagem base com PHP e Apache
FROM php:7.4-apache

# Atualize o sistema e instale as dependências necessárias
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Configure o Apache
RUN a2enmod rewrite
RUN service apache2 restart

# Copie sua aplicação CakePHP para o diretório do servidor web
COPY cake/ /var/www/html/

# Defina as variáveis de ambiente para o CakePHP (ajuste conforme necessário)
ENV DEBUG true
ENV DATABASE_URL postgres://abie:123456@postgres:5432/cake-blog
ENV SECURITY_SALT saltpassword

# Exponha a porta 80
EXPOSE 80

# Comando para iniciar o Apache (você pode personalizar isso conforme necessário)
CMD ["apache2-foreground"]
