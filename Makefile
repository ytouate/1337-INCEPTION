
up: setup
	cd srcs && docker-compose up --build

setup:
	sudo mkdir -p /home/ytouate/data/wordpress
	sudo mkdir -p /home/ytouate/data/database

stop:
	cd srcs && docker-compose down

down:
	cd srcs && docker-compose down --rm all


clean:
	docker system prune

fclean: down
	echo y | docker system prune -a
	cd /home/ytouate/data/wordpress && sudo rm -rf * 
	cd /home/ytouate/data/mariadb && sudo rm -rf *
