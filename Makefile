VERSION:=$(shell cat VERSION)

LDFLAGS="-X main.appVersion=$(VERSION)"

all:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags=$(LDFLAGS) -o prometheus-example-app --installsuffix cgo main.go
	podman build -t ghcr.io/efficacy38/prometheus-example-app:$(VERSION) .
