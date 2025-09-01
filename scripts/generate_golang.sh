#!/bin/bash

PROTO_DIR=./proto
GOLANG_OUT=./golang

# Создаем директории
mkdir -p $GOLANG_OUT

# Устанавливаем необходимые инструменты (если нужно)
# go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
# go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Генерируем Go код
protoc \
    --proto_path=$PROTO_DIR \
    --go_out=$GOLANG_OUT \
    --go-grpc_out=$GOLANG_OUT \
    $PROTO_DIR/auth.proto

echo "Golang code generated successfully!"