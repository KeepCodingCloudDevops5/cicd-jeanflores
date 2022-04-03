DOCKER_USER_NAME=jeanflores2c93
DOCKER_IMAGE_NAME=$(DOCKER_USER_NAME)/terraform-google-sdk-jenkins-agent:latest
GOOGLE_PROJECT=steady-tape-345517
GOOGLE_REGION=us-central1
GOOGLE_ZONE=us-central1-a
FILE_PATH_UPLOAD_GCS_BUCKET=dev_files
DEV_BUCKET_NAME=acme-storage-dev-jean-flores

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
	cd docker && docker build -t jeanflores2c93/base-jenkins-agents:latest -f base.dockerfile .

dpb:
	@echo push to dockerhub
	docker push jeanflores2c93/base-jenkins-agents

dbt:
	@echo docker build terraform image
	cd docker && docker build -t jeanflores2c93/terraform-gcp-sdk-agent:latest -f terraform.dockerfile .

dpt:
	@echo push to dockerhub
	docker push jeanflores2c93/terraform-gcp-sdk-agent

upload-files:
	@echo upload files to gcs bucket in the dev environment.
	export GOOGLE_PROJECT=$(GOOGLE_PROJECT)
	export GOOGLE_REGION=$(GOOGLE_REGION)
	export GOOGLE_ZONE=$(GOOGLE_ZONE)
	gcloud auth application-default login
	gcloud config set project $(GOOGLE_PROJECT)
	gsutil ls
	gsutil cp -r  dev_files gs://$(DEV_BUCKET_NAME)

clear-bucket:
	@echo Get bucket size.
	gcloud auth application-default login
	./dev_files/get_bucket_size.sh -p $(GOOGLE_PROJECT) -r $(GOOGLE_REGION) -z $(GOOGLE_ZONE) -b $(DEV_BUCKET_NAME)

### Dev bucket name
# gs://backend-dev-jean-flores
### Prod bucket name
# gs://backend-prod-jean-flores