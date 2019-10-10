# frozen_string_literal: true

class SayHello < Orders::OrdersService::Service
  def say_hello(hello_req, _unused_call)
    Orders::HelloReply.new(message: "Hello #{hello_req.name}")
  end
end
