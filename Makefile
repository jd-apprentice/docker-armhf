IMAGE_TAG=latest

instance:
	docker buildx create --name arm64 \
          --platform "linux/arm64/v8" \
          --driver "docker-container"

use:
	docker buildx use armv8

login:
	docker login

build:
	docker buildx build \
         --platform "linux/arm64/v8" \
         --tag dyallo/$(IMAGE_NAME):$(IMAGE_TAG) \
	 --push docker/$(IMAGE_NAME) \
	 --no-cache
push:
	docker push dyallo/$(IMAGE_NAME):$(IMAGE_TAG)

run:
	docker run --rm -d -p $(PORT) -v $(VOLUME) $(IMAGE_NAME)
