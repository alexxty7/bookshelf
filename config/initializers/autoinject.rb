# frozen_string_literal: true

require 'orders_services_pb'
require 'catalog_services_pb'

class Container
  extend Dry::Container::Mixin

  register('orders_service', memoize: true) do
    Rpc::OrdersService::Stub.new(ENV.fetch('ORDERS_URL'), :this_channel_is_insecure)
  end

  register('catalog_service', memoize: true) do
    Rpc::CatalogService::Stub.new(ENV.fetch('CATALOG_URL'), :this_channel_is_insecure)
  end
end

AutoInject = Dry::AutoInject(Container)
