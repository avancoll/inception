all:
	docker-compose -f ./srcs/docker-compose.yml build
	sudo echo "127.0.0.1 avancoll.42.fr" >> /etc/hosts
	mkdir -p /home/avancoll/data/database
	mkdir -p /home/avancoll/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up --detach

up:
	docker-compose -f ./srcs/docker-compose.yml up --detach

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean: down
	docker volume rm srcs_mariadb_volume
	docker volume rm srcs_wordpress_volume

fclean: clean
	@docker image rm srcs_mariadb
	@docker image rm srcs_wordpress
	@docker image rm srcs_nginx
	@docker image rm debian:bullseye
	@sudo rm -rf /home/avancoll/data

re: fclean all

.PHONY: all up down clean fclean re
