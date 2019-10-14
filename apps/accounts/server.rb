#!/usr/bin/env ruby

require './config/environment.rb'
Hanami.boot

require 'grpc'
require_relative 'services/accounts_service'

server = GRPC::RpcServer.new
server.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
server.handle(AccountsService)
server.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
