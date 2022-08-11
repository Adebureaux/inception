NAME = inception

SERVICES = nginx

${NAME}:
	@cd srcs/ ; \
	sudo docker-compose up ; \
	sudo docker-compose run ${SERVICES}

all: ${NAME}

clean:
	@sudo docker rm nginx

prune:
	@sudo docker system prune -a

re: clean all

.PHONY: all clean prune re
