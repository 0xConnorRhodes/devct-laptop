shell:
	docker exec -it devct /usr/bin/fish

build:
	docker compose down
	docker compose pull
	docker compose up -d
	./test-startup-finished.sh
