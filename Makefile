all:
	mkdir -p /home/ytouate/data/wordpress
	mkdir -p /home/ytouate/data/database

# RUN cd /home/ytouate/data/wordpress &&                                      \
#     sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/g" wp-config.php &&   \
#     sed -i "s/username_here/${WORDPRESS_DB_USER}/g" wp-config.php   &&      \
#     sed -i "s/password_here/${WORDPRESS_DB_PASSWORD}/g" wp-config.php &&    \
#     sed -i "s/localhost/${WORDPRESS_DB_HOST}/g" wp-config.php