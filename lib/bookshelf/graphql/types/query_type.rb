# frozen_string_literal: true

require_relative 'base_object'

module Types
  class QueryType < Types::BaseObject
    field :say_hello, String, null: false, description: 'An example field'
    field :account_orders, [Types::Order], null: false, description: 'An account orders' do
      argument :account_id, String, required: true
    end

    def say_hello
      'Hello world'
    end

    def account_orders(account_id:)
      response = Container['orders_service'].get_orders_for_account(
        Rpc::GetOrdersForAccountRequest.new(accountId: account_id)
      )
      response.orders
    end
  end
end
