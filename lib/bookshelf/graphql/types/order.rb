# frozen_string_literal: true

require_relative 'base_object'
require_relative 'product'

module Types
  class Order < Types::BaseObject
    field :id, String, null: false
    field :created_at, String, null: false
    field :total_price, String, null: false
    field :products, [Types::Product], null: false
    field :created_at, String, null: false

    def created_at
      object.createdAt
    end

    def total_price
      object.totalPrice
    end
  end
end
