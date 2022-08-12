NAME = inception
COMPOSE = docker-compose
PATH_COMPOSE = -f srcs/docker-compose.yml
VOLUMES = 

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
	${COMPOSE} ${PATH_COMPOSE} exec nginx /bin/bash

debug-wordpress:
	${COMPOSE} ${PATH_COMPOSE} exec wordpress /bin/bash

clean:
	${COMPOSE} ${PATH_COMPOSE} down

fclean:
	${COMPOSE} ${PATH_COMPOSE} down --rmi all --remove-orphans
	docker image prune -f

.PHONY: all start restart stop debug clean fclean
