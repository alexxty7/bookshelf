# frozen_string_literal: true

require_relative 'base_mutation'
require_relative '../types/product'
require_relative '../types/product_attributes'
require_relative '../types/validation_errors'

module Mutations
  class CreateProductMutation < Mutations::BaseMutation
    argument :attributes, Types::ProductAttributes, required: true

    field :product, Types::Product, null: true
    field :errors, Types::ValidationErrors, null: true

    def resolve(attributes:)
      result = Container['catalog_service'].post_product(
        Rpc::PostProductRequest.new(
          name: attributes.name,
          description: attributes.description,
          price: attributes.price
        )
      )
      { product: result.product }
    end
  end
end
