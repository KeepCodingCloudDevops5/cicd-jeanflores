DOCKER_USER_NAME=jeanflores2c93
DOCKER_IMAGE_NAME=$(DOCKER_USER_NAME)/terraform-google-sdk-jenkins-agent:latest

all: dockerize push intregration_test

dockerize:
	@echo docker build
	cd docker && docker build -f Dockerfile -t $(DOCKER_IMAGE_NAME) --platform linux/x86_64 .

push:
	@echo push to dockerhub
	docker push $(DOCKER_IMAGE_NAME)

intregration_test:
	@echo INTEGRATION_TEST
	docker run --rm $(DOCKER_IMAGE_NAME) --platform linux/x86_64

dbb:
	@echo docker build base image
	cd docker && docker build -t jeanflores2c93/base-jenkins-agent:latest -f base.dockerfile .

dpb:
	@echo push to dockerhub
	docker push jeanflores2c93/base-jenkins-agent

dbt:
	@echo docker build terraform image
	cd docker && docker build -t jeanflores2c93/terraform-gcp-sdk-agent:latest -f terraform.dockerfile .

dpt:
	@echo push to dockerhub
	docker push jeanflores2c93/terraform-gcp-sdk-agent