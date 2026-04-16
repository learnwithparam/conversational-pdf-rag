.PHONY: help setup install dev run build up down logs restart clean

.DEFAULT_GOAL := help

BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m

VENV := .venv
UV := uv

help: ## Show this help
	@echo "$(BLUE)Long Document RAG with Conversational Memory$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-15s$(NC) %s\n", $$1, $$2}'

setup: ## Initial setup (create .env, install deps)
	@if [ ! -f .env ]; then cp .env.example .env && echo "$(GREEN)✓ .env created, edit it with your OPENAI_API_KEY$(NC)"; fi
	@if ! command -v uv >/dev/null 2>&1; then curl -LsSf https://astral.sh/uv/install.sh | sh; fi
	@$(UV) sync
	@echo "$(GREEN)✓ Environment ready$(NC)"

install: ## Install dependencies
	@$(UV) sync

dev: setup run ## Setup and run

run: ## Run the conversational PDF tutor
	@$(UV) run python booktutor.py

build: ## Build Docker image
	docker compose build

up: ## Start container
	docker compose up -d

down: ## Stop container
	docker compose down

logs: ## View container logs
	docker compose logs -f

restart: down up ## Restart container

clean: ## Remove venv and caches
	rm -rf $(VENV)
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@echo "$(GREEN)✓ Cleaned$(NC)"
