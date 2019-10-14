# frozen_string_literal: true

require 'orders_services_pb'

class OrdersService < Rpc::OrdersService::Service
  def post_order(request, _call)
    result = PostOrder.new.call(request)
    Rpc::PostOrderResponse.new(order: OrderResponseBuilder.new(result.order).call)
  end
end
