# frozen_string_literal: true

require 'orders_services_pb'

class Container
  extend Dry::Container::Mixin

  register('orders_service', memoize: true) do
    Rpc::OrdersService::Stub.new(ENV.fetch('ORDERS_URL'), :this_channel_is_insecure)
  end
end

AutoInject = Dry::AutoInject(Container)
