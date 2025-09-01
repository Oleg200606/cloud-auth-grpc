#!/bin/bash

PROTO_DIR=./proto
PYTHON_OUT=./python

# Создаем директории
mkdir -p $PYTHON_OUT

# Генерируем Python код
python -m grpc_tools.protoc \
    -I=$PROTO_DIR \
    --python_out=$PYTHON_OUT \
    --grpc_python_out=$PYTHON_OUT \
    --pyi_out=$PYTHON_OUT \
    $PROTO_DIR/auth.proto

# Исправляем импорты в сгенерированных файлах
sed -i 's/import auth_pb2 as auth__pb2/from . import auth_pb2 as auth__pb2/' $PYTHON_OUT/auth_pb2_grpc.py

echo "Python code generated successfully!"