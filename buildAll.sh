#!/bin/bash

GOOS=darwin GOARCH=amd64 go build -o healtchecker-darwin
GOOS=linux GOARCH=amd64 go build -o healtchecker-linux-amd64
GOOS=linux GOARCH=arm64 go build -o healtchecker-linux-arm64
GOOS=linux GOARCH=arm go build -o healtchecker-linux-arm
