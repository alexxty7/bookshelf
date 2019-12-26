# frozen_string_literal: true

require_relative 'base_mutation'
require_relative '../types/account'
require_relative '../types/account_attributes'
require_relative '../types/validation_errors'

module Mutations
  class CreateAccountMutation < Mutations::BaseMutation
    argument :attributes, Types::AccountAttributes, required: true

    field :account, Types::Account, null: true
    field :errors, Types::ValidationErrors, null: true

    def resolve(attributes:)
      result = Container['account_service'].post_account(
        Rpc::PostAccountRequest.new(
          name: attributes.name
        )
      )
      { account: result.account }
    end
  end
end
