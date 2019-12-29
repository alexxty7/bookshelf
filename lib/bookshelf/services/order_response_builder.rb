# frozen_string_literal: true

class OrderResponseBuilder
  def initialize(order)
    @order = order
  end

  def call
    Rpc::Order.new(
      id: order.id.to_s,
      createdAt: order.created_at.to_s,
      accountId: order.account_id.to_s,
      totalPrice: order.total_price,
      products: order_products
    )
  end

  private

  attr_reader :order

  def order_products
    ProductRepository.new.all_with_order(order.id).map do |product|
      Rpc::Order::OrderProduct.new(
        id: product.id.to_s,
        name: product.name,
        description: product.description,
        price: product.price
      )
    end
  end
end
