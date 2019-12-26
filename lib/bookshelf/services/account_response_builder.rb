# frozen_string_literal: true

class AccountResponseBuilder
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def call
    Rpc::Account.new(
      id: account.id.to_s,
      name: account.name,
    )
  end
end
