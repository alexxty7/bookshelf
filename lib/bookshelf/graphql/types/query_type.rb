# frozen_string_literal: true

require_relative 'base_object'

module Types
  class QueryType < Types::BaseObject
    field :say_hello, String, null: false, description: 'An example field' do
      argument :name, String, required: true
    end
    field :account_orders, [Types::Order], null: false, description: 'Get orders by account' do
      argument :account_id, String, required: true
    end
    field :product, Types::Product, null: false, description: 'Get product by id' do
      argument :id, String, required: true
    end

    field :products, [Types::Product], null: false, description: 'Get products by ids' do
      argument :ids, [String], required: true
    end
    field :account, Types::Account, null: false, description: 'Get account by id' do
      argument :id, String, required: true
    end
    field :accounts, [Types::Account], null: false, description: 'Get all accounts'

    def say_hello(name:)
      Container['hello_service'].say_hello(
        Rpc::SayHelloRequest.new(name: name)
      ).message
    end

    def account_orders(account_id:)
      Container['orders_service'].get_orders_for_account(
        Rpc::GetOrdersForAccountRequest.new(accountId: account_id)
      ).orders
    end

    def product(id:)
      Container['catalog_service'].get_product(
        Rpc::GetProductRequest.new(id: id)
      ).product
    end

    def products(ids:)
      Container['catalog_service'].get_products(
        Rpc::GetProductsRequest.new(ids: ids)
      ).products
    end

    def account(id:)
      Container['account_service'].get_account(
        Rpc::GetAccountRequest.new(id: id)
      ).account
    end

    def accounts
      Container['account_service'].get_accounts(
        Rpc::GetAccountsRequest.new
      ).accounts
    end
  end
end
