# frozen_string_literal: true

require_relative 'base_object'
require 'apps/orders/proto/orders_services_pb'

module Types
  class QueryType < Types::BaseObject
    field :say_hello, String, null: false, description: 'An example field added by the generator'

    def say_hello
      stub = Orders::OrdersService::Stub.new(ENV.fetch('ORDERS_URL'), :this_channel_is_insecure)
      stub.say_hello(Orders::HelloRequest.new(name: 'USER')).message
    end
  end
end
