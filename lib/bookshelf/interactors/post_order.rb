# frozen_string_literal: true

require 'hanami/interactor'

class PostOrder
  include Hanami::Interactor
  expose :order

  def call(request)
    @request = request

    create_order
    create_order_products
  end

  private

  attr_reader :repository, :order, :request

  def create_order
    @order = OrderRepository.new.create(account_id: request.accountId, total_price: 100)
  end

  def create_order_products
    OrderProductRepository.new.create(
      request.products.map do |product|
        { product_id: product.productId, quantity: product.quantity, order_id: order.id }
      end
    )
  end
end
