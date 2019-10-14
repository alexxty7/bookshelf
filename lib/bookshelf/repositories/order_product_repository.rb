# frozen_string_literal: true

class OrderProductRepository < Hanami::Repository
  associations do
    belongs_to :order
    belongs_to :product
  end
end
