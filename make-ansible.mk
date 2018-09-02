VPF := tmp/ansible-vault-password

development-setup-env:
	ansible-playbook ansible/development.yml -i ansible/development -vv


production-setup-env:
	ansible-playbook ansible/development.yml -i ansible/production -vv --vault-password-file=$(VPF)


ansible-vaults-encrypt:
	ansible-vault encrypt ansible/production/group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-decrypt:
	ansible-vault decrypt ansible/production/group_vars/all/vault.yml --vault-password-file=$(VPF)


ansible-vaults-edit:
	ansible-vault edit ansible/production/group_vars/all/vault.yml --vault-password-file=$(VPF)
