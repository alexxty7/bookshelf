# frozen_string_literal: true

require_relative 'base_input_object'

module Types
  class AccountAttributes < Types::BaseInputObject
    description 'Attributes for creating an account'

    argument :name, String, required: true
  end
end
