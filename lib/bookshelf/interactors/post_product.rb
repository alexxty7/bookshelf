# frozen_string_literal: true

require 'hanami/interactor'

class PostProduct
  include Hanami::Interactor

  expose :product

  def call(request)
    @product = ProductRepository.new.create(
      name: request.name,
      description: request.description,
      price: request.price
    )
  end
end
