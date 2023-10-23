# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: avancoll <avancoll@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/21 13:47:51 by avancoll          #+#    #+#              #
#    Updated: 2023/10/23 10:54:31 by avancoll         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/avancoll/data/mysql;
	@mkdir -p /home/avancoll/data/html;
	docker compose -f ./srcs/docker-compose.yml up -d

up:
	docker compose -f ./srcs/docker-compose.yml up -d

down:
	docker compose -f  ./srcs/docker-compose.yml down

clean: down
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v

fclean: clean
	@sudo rm -rf /home/avancoll/data/mysql;
	@sudo rm -rf /home/avancoll/data/html;

re: fclean all

.PHONY: all up down clean fclean re
