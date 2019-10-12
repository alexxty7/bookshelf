#!/bin/bash

grpc_tools_ruby_protoc -I apps/orders/protos --ruby_out=apps/orders/rpc --grpc_out=apps/orders/rpc apps/orders/protos/orders.proto
grpc_tools_ruby_protoc -I apps/catalog/protos --ruby_out=apps/catalog/rpc --grpc_out=apps/catalog/rpc apps/catalog/protos/catalog.proto
grpc_tools_ruby_protoc -I apps/accounts/protos --ruby_out=apps/accounts/rpc --grpc_out=apps/accounts/rpc apps/accounts/protos/accounts.proto
