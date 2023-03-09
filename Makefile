
up:
	cd srcs && docker-compose up --build

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

re: clean up
