all:
	mkdir -p /home/ytouate/data/wordpress
	cd ./srcs/ && docker-compose build --no-cache && docker-compose up