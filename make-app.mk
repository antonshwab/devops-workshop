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

app-setup: app-build
	docker-compose run --user=$(USER) app npm install

app-setup-root: app-build
	docker-compose run app npm install

development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv
