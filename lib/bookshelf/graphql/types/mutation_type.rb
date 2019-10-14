# frozen_string_literal: true

require_relative 'base_object'
require_relative '../mutations/create_order_mutation'

module Types
  class MutationType < Types::BaseObject
    field :create_order, mutation: Mutations::CreateOrderMutation
  end
end
