.PHONY: pc-run pc-install pc-update fix-terraform-lint gen-doc


pc-run:
	@pre-commit run --all-files

pc-install:
	@pre-commit install

pc-update:
	@pre-commit autoupdate

fix-terraform-lint:
	@tflint --recursive --fix

gen-doc:
	@terraform-docs markdown table --output-file README.md . --recursive
