VPF := tmp/ansible-vault-password
U := root

development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv


ansible-vaults-encrypt:
	ansible-vault encrypt ansible/production/group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-decrypt:
	ansible-vault decrypt ansible/production/group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-edit:
	ansible-vault edit ansible/production/group_vars/all/vault.yml --vault-password-file=$(VPF)





ansible-deps-install:
	ansible-galaxy install -r requirements.yml




production-setup-env:
	ansible-playbook ansible/development.yml -i ansible/production -u $U -vv --vault-password-file=$(VPF)


production-setup:
	ansible-playbook ansible/site.yml -i ansible/production -u $U -vv --vault-password-file=$(VPF)


production-deploy:
	ansible-playbook ansible/deploy.yml -i ansible/production -u $U -vv --vault-password-file=$(VPF)

production-all: production-setup-env production-setup production-deploy
