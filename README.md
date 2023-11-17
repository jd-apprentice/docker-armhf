# Docker images built in arm/v7 🐋

Learn how to build docker images in arm/v7 architecture with docker buildx and alpine linux.

# Table of Contents 📑

- [Commands 📦](#commands-)
  - [Usage 📋](#usage-)
- [License 📝](#license-)



## Commands 📦

Pay attention that commands have some things hardcoded like this one the `dyallo`

```makefile
build:
	docker buildx build \
         --platform "linux/arm/v7" \
         --tag dyallo/$(IMAGE_NAME):$(IMAGE_TAG) \
	 --push docker/$(IMAGE_NAME) \
	 --no-cache
```

### Usage 📋

IMAGE_TAG has a default value of `latest` and IMAGE_NAME has no default value which means you have to pass it when calling the command.

```bash
make instance
make use
make login
make build IMAGE_NAME="<some-name>" IMAGE_TAG="<some-tag>"
make push IMAGE_NAME="<some-name>" IMAGE_TAG="<some-tag>"
make run IMAGE_NAME="<some-name>" IMAGE_TAG="<some-tag>"
```

## License 📝

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details