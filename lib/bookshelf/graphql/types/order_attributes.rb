# frozen_string_literal: true

require_relative 'base_input_object'

module Types
  class OrderAttributes < Types::BaseInputObject
    description 'Attributes for creating an order'

    class OrderProductAttributes < Types::BaseInputObject
      argument :id, String, required: true
      argument :quantity, Integer, required: true
    end

    argument :account_id, String, required: true
    argument :products, [OrderProductAttributes], required: true
  end
end
