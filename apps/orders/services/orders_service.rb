# frozen_string_literal: true

require 'orders_services_pb'

class OrdersService < Rpc::OrdersService::Service
  def post_order(request, _call)
    result = PostOrder.new.call(request)
    Rpc::PostOrderResponse.new(order: OrderResponseBuilder.new(result.order).call)
  end

  def get_orders_for_account(request, _call)
    account = AccountRepository.new.find_with_orders(request.account_id)
    Rpc::GetOrdersForAccountResponse.new(
      orders: account.orders.map { |order| OrderResponseBuilder.new(order).call }
    )
  end
end
