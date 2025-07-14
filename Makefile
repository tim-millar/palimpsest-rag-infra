SHELL := /usr/bin/env bash

# HOW TO EXECUTE

# Executing Terraform PLAN
#	$ make tf-plan

# Executing Terraform APPLY
#   $ make tf-apply

# Executing Terraform DESTROY
#	$ make tf-destroy

all-test: clean tf-plan

.PHONY: clean
clean:
	rm -rf .terraform

.PHONY: tf-plan
tf-plan:
	terraform fmt && terraform init -reconfigure && terraform validate && terraform plan

.PHONY: tf-apply
tf-apply:
	terraform fmt && terraform init -reconfigure && terraform validate && terraform apply -auto-approve

.PHONY: tf-destroy
tf-destroy:
	terraform init  -reconfigure && terraform destroy
