# frozen_string_literal: true

class ProductResponseBuilder
  attr_reader :product

  def initialize(product)
    @product = product
  end

  def call
    Rpc::Product.new(
      id: product.id.to_s,
      name: product.name,
      description: product.description,
      price: product.price
    )
  end
end
