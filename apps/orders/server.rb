#!/usr/bin/env ruby

require './config/environment.rb'
Hanami.boot

require 'grpc'
require 'apps/orders/proto/orders_services_pb'
require_relative 'services/say_hello'

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(SayHello)
server.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
