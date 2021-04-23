SHELL=/bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --silent
###################################
include .env
ENV_ALPINE = $(shell grep -oP 'FROM_ALPINE=\K(.+)' .env)
DF_ALPINE = $(shell grep -oP 'FROM alpine:\K(.+)' Dockerfile)
###############################################
# https://github.com/commonmark/cmark/releases
###############################################
.PHONY: build
build:
	@docker buildx build --output "type=image,push=false" \
  --tag docker.pkg.github.com/$(REPO_OWNER)/$(REPO_NAME)/$(PKG_NAME):$(RELEASE) \
  --tag $(REPO_OWNER)/$(REPO_NAME):$(RELEASE) \
  --build-arg RELEASE='$(RELEASE)' \
.


