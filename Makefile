up:
	@echo "Running zkEVM..."
	sudo docker compose --env-file .env -f docker-compose-main.yml up -d $(filter-out $@,$(MAKECMDGOALS))

down:
	@echo "Stopping zkEVM..."
	sudo docker compose --env-file .env -f docker-compose-main.yml down $(filter-out $@,$(MAKECMDGOALS))

restart:
	@echo "Restarting zkEVM..."
	sudo docker compose --env-file .env -f docker-compose-main.yml restart $(filter-out $@,$(MAKECMDGOALS))

ps:
	sudo docker compose --env-file .env -f docker-compose-main.yml ps

logs:
	sudo docker compose --env-file .env -f docker-compose-main.yml logs --tail 100 -f $(filter-out $@,$(MAKECMDGOALS))

clean-all:
	sudo docker stop $$( docker ps -aq) || true
	sudo docker rm $$( docker ps -aq) || true
	sudo docker volume rm $$( docker volume ls -q) || true
	sudo docker system prune -f --all || true
	sudo docker rm $$( docker images -q) || true

clean-data:
	rm -rf ./data
	mkdir ./data ./data/pooldb ./data/statedb
