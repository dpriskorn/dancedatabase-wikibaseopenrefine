.PHONY: help install run test docker-build docker-up docker-down clean

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  install       Install Python dependencies"
	@echo "  run           Run the reconciliation service locally"
	@echo "  test          Run tests"
	@echo "  docker-build  Build Docker container"
	@echo "  docker-up     Start Docker containers"
	@echo "  docker-down   Stop Docker containers"
	@echo "  clean         Remove generated files"
	@echo "  help          Show this help message"

install:
	poetry install

run: install
	poetry run hypercorn app:app --reload --bind 0.0.0.0:8001

test:
	pytest

docker-build:
	docker compose build

docker-up:
	docker compose up -d

docker-down:
	docker compose down

clean:
	rm -rf __pycache__ .pytest_cache .ruff_cache *.pyc **/*.pyc
