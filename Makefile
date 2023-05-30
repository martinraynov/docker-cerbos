M = $(shell printf "\033[34;1m▶\033[0m")

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

######################
### MAIN FUNCTIONS ###
######################

.PHONY: start
start: ## Start the cerbos docker container
	$(info $(M) Starting an instance of cerbos)
	@docker stack rm cerbos
	@docker stack deploy -c ./docker/docker-compose-swarm.yml cerbos

.PHONY: stop
stop: ## Stopping running cerbos instances
	$(info $(M) Stopping cerbos instance)
	@docker stack rm cerbos

.DEFAULT_GOAL := help