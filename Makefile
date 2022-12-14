NAME			= inception
COMPOSE			= docker-compose
PATH_COMPOSE	= -f srcs/docker-compose.yml

all: ${NAME}

${NAME}:
	@cat /etc/hosts | if ! grep -P "127.0.0.1\tadeburea.42.fr"; then sudo sh -c 'echo "127.0.0.1\tadeburea.42.fr" >> /etc/hosts'; fi
	@sudo mkdir -p /home/adeburea/data/wordpress
	@sudo mkdir -p /home/adeburea/data/mariadb
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

debug-mariadb:
	${COMPOSE} ${PATH_COMPOSE} exec mariadb /bin/bash

clean:
	${COMPOSE} ${PATH_COMPOSE} down

fclean:
	${COMPOSE} ${PATH_COMPOSE} down --rmi all -v
	@bash srcs/fclean.sh

.PHONY: all start restart stop debug-nginx debug-wordpress debug-mariadb clean fclean
