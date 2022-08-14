NAME = inception
COMPOSE = docker-compose
PATH_COMPOSE = -f srcs/docker-compose.yml

all: ${NAME}

${NAME}:
	${COMPOSE} ${PATH_COMPOSE} up -d --build

start:
	${COMPOSE} ${PATH_COMPOSE} start

restart:
	${COMPOSE} ${PATH_COMPOSE} restart

stop:
	${COMPOSE} ${PATH_COMPOSE} stop

debug-nginx:
	${COMPOSE} ${PATH_COMPOSE} exec nginx /bin/sh

debug-wordpress:
	${COMPOSE} ${PATH_COMPOSE} exec wordpress /bin/sh

debug-mariadb:
	${COMPOSE} ${PATH_COMPOSE} exec mariadb /bin/sh

ps:
	${COMPOSE} ${PATH_COMPOSE} ps

images:
	${COMPOSE} ${PATH_COMPOSE} images

clean:
	${COMPOSE} ${PATH_COMPOSE} down

fclean:
	${COMPOSE} ${PATH_COMPOSE} down --rmi all --remove-orphans -v
	@bash srcs/fclean.sh

.PHONY: all start restart stop debug clean fclean
