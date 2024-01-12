all:
	cd srcs && sudo docker-compose --verbose up -d --build

clean:
	cd srcs && sudo docker-compose down --remove-orphans \
	&& sudo docker volume rm srcs_mariadb \
	&& sudo docker volume rm srcs_wordpress || true \
	&& sudo docker network rm srcs_inception || true

fclean: clean
	cd srcs && sudo docker-compose down --rmi all --volumes --remove-orphans || true

re: fclean all

.PHONY: all clean fclean re