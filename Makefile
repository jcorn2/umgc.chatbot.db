# Stuff

# Build vars
DOCKER_NAME=chatbot-db
DOCKER_TAG=latest
DOCKER_IMG=$(DOCKER_NAME):$(DOCKER_TAG)

# Phony
.PHONY: all start clear push help

all:
	docker build -f ./docker/Dockerfile -t $(DOCKER_IMG) .

start:
	docker run --net=host --rm -d --name mysql $(DOCKER_IMG)