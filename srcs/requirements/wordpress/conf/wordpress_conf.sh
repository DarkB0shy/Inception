#!/bin/sh
rm -rf /var/www/html/wordpress/wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost="mariadb" --path="/var/www/html/wordpress/" --allow-root --skip-check
<<<<<<< HEAD
wp core install --url="dcarassi.42.fr" --title="dcarassi's wp" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create pippo ${WP_USER_MAIL} --role=author --user-pass=$WP_USER_PSWD --allow-root

=======
if ! wp core is-installed --allow-root; then
	wp core install --url="dcarassi.42.fr" --title="dcarassi's wp" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PSWD --admin_email=$WP_ADMIN_EMAIL --path=/var/www/html/wordpress/ --allow-root
fi
if ! wp user get Pippo --allow-root; then
	wp user create Pippo carassitidavide@gmail.com --role=author --user-pass="qwerty" --allow-root
fi
>>>>>>> refs/remotes/origin/main
chown -R www-data:www-data /var/www/html/wordpress
exec php-fpm7.3 --nodaemonize
