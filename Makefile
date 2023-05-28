up:
	@echo "Running zkEVM..."
	docker compose --env-file .env -f docker-compose-main.yml up -d $(filter-out $@,$(MAKECMDGOALS))

down:
	@echo "Stopping zkEVM..."
	docker compose --env-file .env -f docker-compose-main.yml down $(filter-out $@,$(MAKECMDGOALS))

restart:
	@echo "Restarting zkEVM..."
	docker compose --env-file .env -f docker-compose-main.yml restart $(filter-out $@,$(MAKECMDGOALS))

ps:
	docker compose --env-file .env -f docker-compose-main.yml ps

logs:
	docker compose --env-file .env -f docker-compose-main.yml logs --tail 100 -f $(filter-out $@,$(MAKECMDGOALS))

clean-all:
	docker stop $$( docker ps -aq) || true
	docker rm $$( docker ps -aq) || true
	docker volume rm $$( docker volume ls -q) || true
	docker system prune -f --all || true
	docker rm $$( docker images -q) || true

clean-data:
	rm -rf ./data
	mkdir ./data ./data/pooldb ./data/statedb
