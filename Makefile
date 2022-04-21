SHELL := /bin/bash

plan:
	cd stacks; tfswitch
	cd stacks; terraform init -input=false
	cd stacks; terraform plan -input=false -no-color -compact-warnings -out plan.tfplan

apply:
	cd stacks; tfswitch
	cd stacks; terraform init -input=false
	cd stacks; terraform apply -input=false -no-color -compact-warnings -auto-approve