#!/bin/bash

grpc_tools_ruby_protoc --ruby_out=./ --grpc_out=./ apps/orders/proto/orders.proto
grpc_tools_ruby_protoc --ruby_out=./ --grpc_out=./ apps/catalog/proto/catalog.proto
grpc_tools_ruby_protoc --ruby_out=./ --grpc_out=./ apps/accounts/proto/accounts.proto
