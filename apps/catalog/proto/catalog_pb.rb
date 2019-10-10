# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: apps/catalog/proto/catalog.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("apps/catalog/proto/catalog.proto", :syntax => :proto3) do
    add_message "catalog.Product" do
      optional :id, :string, 1
      optional :name, :string, 2
      optional :description, :string, 3
      optional :price, :double, 4
    end
    add_message "catalog.PostProductRequest" do
      optional :name, :string, 1
      optional :description, :string, 2
      optional :price, :double, 3
    end
    add_message "catalog.PostProductResponse" do
      optional :product, :message, 1, "catalog.Product"
    end
    add_message "catalog.GetProductRequest" do
      optional :id, :string, 1
    end
    add_message "catalog.GetProductResponse" do
      optional :product, :message, 1, "catalog.Product"
    end
    add_message "catalog.GetProductsRequest" do
      optional :skip, :uint64, 1
      optional :take, :uint64, 2
      repeated :ids, :string, 3
      optional :query, :string, 4
    end
    add_message "catalog.GetProductsResponse" do
      repeated :products, :message, 1, "catalog.Product"
    end
  end
end

module Catalog
  Product = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.Product").msgclass
  PostProductRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.PostProductRequest").msgclass
  PostProductResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.PostProductResponse").msgclass
  GetProductRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.GetProductRequest").msgclass
  GetProductResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.GetProductResponse").msgclass
  GetProductsRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.GetProductsRequest").msgclass
  GetProductsResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("catalog.GetProductsResponse").msgclass
end