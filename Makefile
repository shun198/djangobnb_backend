CONTAINER_NAME = app
RUN_APP = docker-compose exec $(CONTAINER_NAME)
RUN_POETRY =  $(RUN_APP) poetry run
RUN_DJANGO = $(RUN_POETRY) python manage.py
RUN_PYTEST = $(RUN_POETRY) pytest

prepare:
	docker-compose up -d --build

up:
	docker-compose up -d

build:
	docker-compose build

down:
	docker-compose down

loaddata:
	$(RUN_DJANGO) loaddata fixture.json

makemigrations:
	$(RUN_DJANGO) makemigrations

migrate:
	$(RUN_DJANGO) migrate

show_urls:
	$(RUN_DJANGO) show_urls

shell:
	$(RUN_DJANGO) debugsqlshell

superuser:
	$(RUN_DJANGO) createsuperuser

test:
	$(RUN_PYTEST)

format:
	$(RUN_POETRY) black .
	$(RUN_POETRY) isort .

update:
	$(RUN_APP) poetry update
	npm update $(FRONTEND_PATH)

db:
	docker exec -it db bash

collectstatic:
	$(RUN_DJANGO) collectstatic
