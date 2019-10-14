# frozen_string_literal: true

require_relative 'base_object'

module Types
  class QueryType < Types::BaseObject
    field :say_hello, String, null: false, description: 'An example field'

    def say_hello
      'Hello world'
    end
  end
end
