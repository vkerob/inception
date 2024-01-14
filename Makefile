all:
	mkdir -p /home/vkerob/data/wordpress \
	&& mkdir -p /home/vkerob/data/mariadb \
	&& cd srcs && sudo docker-compose up -d --build

clean:
	cd srcs && sudo docker-compose down --remove-orphans \
	&& sudo docker volume rm srcs_mariadb \
	&& sudo docker volume rm srcs_wordpress || true

fclean: clean
	cd srcs && sudo docker-compose down --rmi all --volumes --remove-orphans || true

re: fclean all

.PHONY: all clean fclean re