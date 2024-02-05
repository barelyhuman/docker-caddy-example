

start:
	docker compose -f docker-compose.goblin.yml -f docker-compose.yml up -d

stop:
	docker compose -f docker-compose.goblin.yml -f docker-compose.yml stop

restart:
	docker compose -f docker-compose.goblin.yml -f docker-compose.yml restart

reset:
	docker compose -f docker-compose.goblin.yml -f docker-compose.yml down -v
	make start