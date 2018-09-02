USER = "$(shell id -u):$(shell id -g)"

# TODO
# make npm can install without root rights

app:
	docker-compose up

app-build:
	docker-compose build

app-bash:
	docker-compose run --user=$(USER) app bash

app-bash-root:
	docker-compose run app bash

app-setup: development-setup-env app-build
	docker-compose run --user=$(USER) app npm install

app-setup-root: development-setup-env app-build
	docker-compose run app npm install


production-app-build:
	docker-compose -f docker-compose.prod.yml build

app-setup-production: production-setup-env production-app-build

app-production:
	docker-compose -f docker-compose.prod.yml up
