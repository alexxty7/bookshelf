# frozen_string_literal: true

require_relative 'base_mutation'
require_relative '../types/order'
require_relative '../types/order_attributes'
require_relative '../types/validation_errors'

module Mutations
  class CreateOrderMutation < Mutations::BaseMutation
    argument :attributes, Types::OrderAttributes, required: true

    field :order, Types::Order, null: true
    field :errors, Types::ValidationErrors, null: true

    def resolve(attributes:)
      result = Container['orders_service'].post_order(
        Rpc::PostOrderRequest.new(
          accountId: attributes.account_id,
          products: order_products(attributes.products)
        )
      )
      { order: result.order }
    end

    def order_products(products)
      products.map do |product|
        Rpc::PostOrderRequest::OrderProduct.new(
          productId: product.id,
          quantity: product.quantity
        )
      end
    end
  end
end
