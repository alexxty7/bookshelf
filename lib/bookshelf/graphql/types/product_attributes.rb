# frozen_string_literal: true

require_relative 'base_input_object'

module Types
  class ProductAttributes < Types::BaseInputObject
    description 'Attributes for creating a product'

    argument :name, String, required: true
    argument :description, String, required: true
    argument :price, Float, required: true
  end
end
