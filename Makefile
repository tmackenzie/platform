SHELL := /bin/bash

plan:
	tfswitch
	terraform init -input=false
	terraform plan -input=false -no-color -compact-warnings -out plan.tfplan

apply:
	tfswitch
	terraform init -input=false
	terraform apply -input=false -no-color -compact-warnings -auto-approve