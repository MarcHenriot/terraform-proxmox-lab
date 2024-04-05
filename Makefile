SHELL=/bin/bash

.PHONY: lint leaks fmt gen-doc

lint:
	@tflint --recursive

leaks:
	@docker pull ghcr.io/gitleaks/gitleaks:latest
	@docker run -v $(shell pwd):/path ghcr.io/gitleaks/gitleaks:latest detect --source="/path" -v

fmt:
	@terraform fmt -recursive -write=true .

gen-doc:
	@terraform-docs markdown table --output-file README.md . --recursive