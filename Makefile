all: up

up:
	docker compose -f ./srcs/docker-compose.yml build
	mkdir -p /home/avancoll/data/mariadb
	mkdir -p /home/avancoll/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --detach

down:
	docker compose -f ./srcs/docker-compose.yml down

rm: down
	docker volume rm srcs_mariadb_volume
	docker volume rm srcs_wordpress_volume
	docker image rm srcs_mariadb
	docker image rm srcs_wordpress
	docker image rm srcs_nginx
	docker image rm debian:bullseye
	sudo rm -rf /home/avancoll/data

.PHONY: all up down clean fclean
