# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: hello.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("hello.proto", :syntax => :proto3) do
    add_message "rpc.SayHelloRequest" do
      optional :name, :string, 1
    end
    add_message "rpc.SayHelloResponse" do
      optional :message, :string, 1
    end
  end
end

module Rpc
  SayHelloRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("rpc.SayHelloRequest").msgclass
  SayHelloResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("rpc.SayHelloResponse").msgclass
end
