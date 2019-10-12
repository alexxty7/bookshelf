# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: orders.proto for package 'rpc'

require 'grpc'
require 'orders_pb'

module Rpc
  module OrdersService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'rpc.OrdersService'

      rpc :PostOrder, PostOrderRequest, PostOrderResponse
      rpc :GetOrdersForAccount, GetOrdersForAccountRequest, GetOrdersForAccountResponse
      rpc :SayHello, HelloRequest, HelloReply
    end

    Stub = Service.rpc_stub_class
  end
end