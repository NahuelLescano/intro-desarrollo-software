.PHONY: up down logs reset ps

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	docker compose ps

delete:
	docker compose down -v

reset:
	docker compose down -v
	docker compose up -d
