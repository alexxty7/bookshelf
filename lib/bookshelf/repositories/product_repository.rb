# frozen_string_literal: true

class ProductRepository < Hanami::Repository
  associations do
    has_many :order_products
    has_many :orders, through: :order_products
  end

  def all_with_order(order_id)
    products.join(orders).where(orders[:id].qualified => order_id).map_to(Product).to_a
  end

  def by_id_in_range(*ids)
    products.where { id.in(*ids) }.to_a
  end
end
