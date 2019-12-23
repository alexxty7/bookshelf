# frozen_string_literal: true

class AccountRepository < Hanami::Repository
  associations do
    has_many :orders
  end

  def find_with_orders(id)
    aggregate(:orders).where(id: id).as(Account).one
  end
end
