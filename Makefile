# GraphJudge Leaderboard - Makefile

.SILENT:
.PHONY: help setup

.DEFAULT_GOAL := help

help:  ## Show available commands
	echo "Usage: make [command]"
	echo ""
	echo "Commands:"
	awk '/^[a-zA-Z0-9_-]+:.*?##/ { \
		helpMessage = match($$0, /## (.*)/); \
		if (helpMessage) { \
			recipe = $$1; \
			sub(/:/, "", recipe); \
			printf "  \033[36m%-15s\033[0m %s\n", recipe, substr($$0, RSTART + 3, RLENGTH) \
		} \
	}' $(MAKEFILE_LIST)

setup:  ## Install Python dependencies for utility scripts
	echo "Installing Python dependencies..."
	pip install tomli tomli-w requests pyyaml
	echo "Setup complete"
