# frozen_string_literal: true

require_relative 'base_object'

module Types
  class Account < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
  end
end
