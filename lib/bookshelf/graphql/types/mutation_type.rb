# frozen_string_literal: true

require_relative 'base_object'
require_relative '../mutations/create_order_mutation'
require_relative '../mutations/create_product_mutation'

module Types
  class MutationType < Types::BaseObject
    field :create_order, mutation: Mutations::CreateOrderMutation
    field :create_product, mutation: Mutations::CreateProductMutation
  end
end
