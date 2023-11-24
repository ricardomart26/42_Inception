
WP_VOLUME_DIR=/home/${LOGNAME}/data/wp_vol
DB_VOLUME_DIR=/home/${LOGNAME}/data/db_vol

all: run

build_vol:
	test -d $(WP_VOLUME_DIR) || sudo mkdir -p $(WP_VOLUME_DIR)
	test -d $(DB_VOLUME_DIR) || sudo mkdir -p $(DB_VOLUME_DIR)

rm_vol: down
	docker volume rm srcs_db_vol || true
	docker volume rm srcs_wp_vol || true
	sudo rm -rf $(WP_VOLUME_DIR) || true
	sudo rm -rf $(DB_VOLUME_DIR) || true

vol: down rm_vol build_vol

run: build_vol
	docker network create inception-network || true; 
	docker-compose -f srcs/docker-compose.yaml up --build  -d

down: 
	docker-compose -f srcs/docker-compose.yaml down

clean: down rm_vol
	docker network rm inception-network || true
	docker system prune -a

restart: down vol run

re: clean run

.PHONY: all run clean re
