# frozen_string_literal: true

require 'catalog_services_pb'

class CatalogService < Rpc::CatalogService::Service
  def post_product(request, _call)
    result = PostProduct.new.call(request)
    Rpc::PostProductResponse.new(product: ProductResponseBuilder.new(result.product).call)
  end

  def get_product(request, _call)
    product = ProductRepository.new.find(request.id)
    Rpc::GetProductResponse.new(product: ProductResponseBuilder.new(product).call)
  end

  def get_products(request, _call)
    products = ProductRepository.new.by_ids(*request.ids)
    Rpc::GetProductsResponse.new(
      products: products.map { |product| ProductResponseBuilder.new(product).call }
    )
  end
end
