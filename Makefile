CURRENT_TIME:=$(shell date +%s)
PWD:=$(shell pwd)
LOG_FILE?="ansible_${CURRENT_TIME}.output"
LOG?=false
FILE?=""
VERBOSITY=-v
EXTRA_ARGS?=
EXTRA_VARS?=

ANSIBLE_ROOT_DIR=${PWD}
ANSIBLE_BOOKS?="${ANSIBLE_ROOT_DIR}/books"
ANSIBLE_PLAYS?="${ANSIBLE_ROOT_DIR}/playbooks"
ANSIBLE_HOSTS?="${ANSIBLE_ROOT_DIR}/inventory.yml"

define run_ansible
    ansible-galaxy collection install -f ewe
	$(if $(($(LOG),true)),(ansible-playbook ${VERBOSITY} -i ${ANSIBLE_HOSTS} --extra-vars "${EXTRA_VARS}" ${EXTRA_ARGS} "${ANSIBLE_ROOT_DIR}/$1.yml" | tee ${LOG_FILE}),(ansible-playbook ${VERBOSITY} -i ${ANSIBLE_HOSTS} --extra-vars "${EXTRA_VARS}" ${EXTRA_ARGS} ${ANSIBLE_ROOT_DIR}/$1.yml))
endef

deploy_book:
	$(call run_ansible,books/${FILE})

deploy_play:
	$(call run_ansible,playbooks/${FILE})


encrypt_file:
	ansible-vault encrypt --vault-password-file ./secrets.txt ${FILE}

reencrypt_file:
	ansible-vault rekey --vault-password-file ./secrets.txt ${FILE}

encrypt_secrets:
	ansible-vault encrypt ewe/infra/roles/docker_registry/files/certs/* vars/secrets.yml

decrypt_secrets:
	ansible-vault decrypt ewe/infra/roles/docker_registry/files/certs/* vars/secrets.yml
