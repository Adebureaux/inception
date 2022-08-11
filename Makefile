NAME = inception

all: ${NAME}

${NAME}:
	@docker compose -f srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f srcs/docker-compose.yml stop

prune:
	@docker system prune -a

re: prune all

.PHONY: all stop prune re
