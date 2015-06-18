FROM tutum/lamp:latest
MAINTAINER endrjuskr

# Install plugins
RUN apt-get update && \
  apt-get -y install php5-gd curl && \
  rm -rf /var/lib/apt/lists/*
  
# Download latest version of Wordpress into /app
RUN rm -fr /app && git clone --depth=1 https://github.com/WordPress/WordPress.git /app

# Configure Wordpress to connect to local DB
ADD wp-config.php /app/wp-config.php

# Modify permissions to allow plugin upload
RUN chown -R www-data:www-data /app/wp-content /var/www/html

# Add database setup script
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD create_db.sh /create_db.sh
ADD wp-cli.phar /wp-cli.phar
RUN chmod +x /*.sh /*.phar

RUN php /wp-cli.phar --allow-root --info
RUN php /wp-cli.phar core install --allow-root --path=/app/ --url=http://localhost:80 --title=test --admin_name=endrju --admin_email=endrju@endrju.pl --admin_password=test1234


EXPOSE 80 3306
CMD ["/run.sh"]
