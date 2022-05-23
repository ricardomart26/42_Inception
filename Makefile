
WP_VOLUME_DIR=/home/${LOGNAME}/data/wp_vol
DB_VOLUME_DIR=/home/${LOGNAME}/data/db_vol

all: run

build_vol:
	test -d $(WP_VOLUME_DIR) || sudo mkdir -p $(WP_VOLUME_DIR)
	test -d $(DB_VOLUME_DIR) || sudo mkdir -p $(DB_VOLUME_DIR)

rm_vol:
	sudo rm -rf $(WP_VOLUME_DIR)
	sudo rm -rf $(DB_VOLUME_DIR)
	sudo docker volume rm 42_inception_db_data || true
	sudo docker volume rm 42_inception_wp_data || true

vol: down rm_vol build_vol

run:
	sudo docker network create inception-network || true; 
	sudo docker-compose -f srcs/docker-compose.yaml up --build  -d

down: 
	sudo docker-compose -f srcs/docker-compose.yaml down

clean: down
	sudo docker network rm inception-network || true
	sudo docker volume rm $(sudo docker volume ls -qf "dangling="true"") || true
	sudo docker system prune -a

restart: down vol run

re: clean run

.PHONY: all run clean re
