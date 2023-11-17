IMAGE_TAG=latest

instance:
	docker buildx create --name armv7 \
          --platform "linux/arm/v7" \
          --driver "docker-container"

use:
	docker buildx use armv7

login:
	docker login

build:
	docker buildx build \
         --platform "linux/arm/v7" \
         --tag dyallo/$(IMAGE_NAME):$(IMAGE_TAG) \
	 --push docker/$(IMAGE_NAME) \
	 --no-cache
push:
	docker push dyallo/$(IMAGE_NAME):$(IMAGE_TAG)

run:
	docker run --rm -d -p $(PORT) -v $(VOLUME) $(IMAGE_NAME)
