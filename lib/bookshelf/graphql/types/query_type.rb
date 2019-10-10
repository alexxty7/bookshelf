# frozen_string_literal: true

require_relative 'base_object'

module Types
  class QueryType < Types::BaseObject
    field :say_hello, String, null: false, description: 'An example field added by the generator'

    def say_hello
      Container['orders_service'].say_hello(Orders::HelloRequest.new(name: 'USER')).message
    end
  end
end
