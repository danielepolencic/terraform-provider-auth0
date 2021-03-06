PKGS ?= $(shell go list ./...)
TESTS ?= ".*"
COVERS ?= "c.out"

build:
	@go build $(PKGS)

install: build
	@go install

test:
	@go test $(PKGS)

testacc:
	@TF_ACC=1 go test $(PKGS) -v -coverprofile=$(COVERS) -run ^$(TESTS)$
