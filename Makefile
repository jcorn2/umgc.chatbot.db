##############################################################
# Makefile for Chatbot db
##############################################################

# Build vars
DOCKER_NAME=chatbot-db
DOCKER_TAG=latest
DOCKER_IMG=$(DOCKER_NAME):$(DOCKER_TAG)
REMOTE_IMG:=docker.io/umgccaps/$(DOCKER_IMG)

# PHONY
.PHONY: all start clear push help

####################################################################
#	make all:
#		This builds the mysql Docker image.
#
####################################################################
all:
	docker build -f ./docker/Dockerfile -t $(DOCKER_IMG) .

####################################################################
#	make start:
#		This starts the mysql docker image. 
#
####################################################################
start:
	docker run --net=host --rm -d --name mysql $(DOCKER_IMG)

####################################################################
#	make push:
#		This pushes the Docker image to $(REMOTE_IMG)
#
####################################################################
push:
	docker tag $(DOCKER_IMG) $(REMOTE_IMG)
	docker push $(REMOTE_IMG)

# This prints make commands and usage
help:
	@$(info cahtbot db)
	@$(info Prerequisites: )
	@$(info 1. GNU BASH version 4.2.46+)
	@$(info 2. GNU Make version 3.82+)
	@$(info 3. Docker version 19.03.12+)
	@$(info -----------------------------------------------------------------------------------------------------------)
	@cat Makefile | sed -n -e '/####/,/#####/ p' | grep -v '###' | sed -e 's/#//g' | grep -v Makefile|grep -v help
