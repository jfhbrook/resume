set dotenv-load := true
set windows-shell := ['pwsh', '-Command']

generate:
  if [ ! -d venv ]; then just install; fi
  . ./venv/bin/activate && python generate.py

#
# Installing, updating and upgrading dependencies
#

_venv:
  if [ ! -d venv ]; then python3 -m venv venv; . ./venv/bin/activate && pip install pip pip-tools wheel; fi

_clean-venv:
  rm -rf venv

# Install all dependencies
install:
  @just _venv
  @just compile
  . ./venv/bin/activate && pip install -r requirements_dev.txt
  . ./venv/bin/activate && pip install -e .

# Update all dependencies
update:
  @just _venv
  . ./venv/bin/activate && pip install pip pip-tools wheel --upgrade
  @just _clean-compile
  @just install

# Update all dependencies and rebuild the environment
upgrade:
  if [ -d venv ]; then just update && just check && just _upgrade; else just update; fi

_upgrade:
  @just _clean-venv
  @just _venv
  @just _clean-compile
  @just compile
  @just install

# Generate locked requirements files based on dependencies in pyproject.toml
compile:
  . ./venv/bin/activate && python -m piptools compile --resolver=backtracking -o requirements.txt pyproject.toml
  . ./venv/bin/activate && python -m piptools compile --resolver=backtracking --extra=dev -o requirements_dev.txt pyproject.toml

_clean-compile:
  rm -f requirements.txt
  rm -f requirements_dev.txt

#
# Development tooling - linting, formatting, etc
#

# Format with black and isort
format:
  . ./venv/bin/activate &&  black './resume' ./tests
  . ./venv/bin/activate &&  isort --settings-file . './resume' ./tests

# Lint with flake8
lint:
  . ./venv/bin/activate && flake8 './resume' ./tests
  . ./venv/bin/activate && validate-pyproject ./pyproject.toml

# Check type annotations with pyright
check:
  . ./venv/bin/activate && npx pyright@latest

# Run tests with pytest
test:
  . ./venv/bin/activate && pytest ./tests
  @just _clean-test

_clean-test:
  rm -f pytest_runner-*.egg
  rm -rf tests/__pycache__

#
# Shell and console
#

shell:
  . ./venv/bin/activate && bash

console:
  . ./venv/bin/activate && jupyter console

# Clean up loose files
clean: _clean-venv _clean-compile _clean-test
  rm -rf resume.egg-info
  rm -f resume/*.pyc
  rm -rf resume/__pycache__
