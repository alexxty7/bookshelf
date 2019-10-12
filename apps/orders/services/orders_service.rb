# frozen_string_literal: true

require 'orders_services_pb'

class OrdersService < Rpc::OrdersService::Service
  def say_hello(hello_req, _unused_call)
    Rpc::HelloReply.new(message: "Hello #{hello_req.name}")
  end
end
