# frozen_string_literal: true

class OrderRepository < Hanami::Repository
  associations do
    belongs_to :account

    has_many :order_products
    has_many :products, through: :order_products
  end
end
