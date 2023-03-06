
up: setup
	cd srcs && docker-compose up --build

setup:
	sudo mkdir -p /home/ytouate/data/wordpress
	sudo mkdir -p /home/ytouate/data/database

stop:
	cd srcs && docker-compose down 2> /dev/null

down:
	cd srcs && docker-compose down --rm all 2> /dev/null

clean: stop
	echo y | docker system prune

fclean: down
	echo y | docker system prune -a
	@if  [ ! -z "$(docker volume ls -q)" ]; then \
		docker volume rm $(docker volume ls -q); \
	fi
	@if  [ ! -z "$(docker image ls -q)" ]; then \
		docker rmi $(docker image ls -q); 	\
	fi
	cd /home/ytouate/data/wordpress && sudo rm -rf * 
	cd /home/ytouate/data/mariadb && sudo rm -rf *

re: clean up
