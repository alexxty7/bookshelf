# frozen_string_literal: true

require_relative 'base_object'

module Types
  class Product < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :price, Float, null: false
    field :quantity, Integer, null: false
  end
end
