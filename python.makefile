.PHONY: help venv install
.DEFAULT_GOAL := help

help: ## Displays this help message.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

venv: ## Create a local python3.11 venv to install ansible in
	python3.11 -m venv venv
	./venv/bin/pip install --upgrade pip
	./venv/bin/pip install pip-tools

install: ## Install python requirements
	./venv/bin/pip install -r requirements.txt

