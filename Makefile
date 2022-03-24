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