# Docker images built in arm/v7 🐋

Learn how to build docker images in arm/v7 architecture with docker buildx and alpine linux.

# Table of Contents 📑

- [Commands 📦](#commands-)
- [License 📝](#license-)

## Commands 📦

```make
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
          --push $(PATH)

run:
        docker run --rm -d -p $(PORT) -v $(VOLUME) $(IMAGE_NAME)
```

## License 📝

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details