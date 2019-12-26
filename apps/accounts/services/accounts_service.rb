# frozen_string_literal: true

require 'accounts_services_pb'

class AccountsService < Rpc::AccountService::Service
  def post_account(request, _call)
    result = PostAccount.new.call(request)
    Rpc::PostAccountResponse.new(account: AccountResponseBuilder.new(result.account).call)
  end

  def get_account(request, _call)
    account = AccountRepository.new.find(request.id)
    Rpc::GetAccountResponse.new(account: AccountResponseBuilder.new(account).call)
  end

  def get_accounts(_request, _call)
    accounts = AccountRepository.new.all
    Rpc::GetAccountsResponse.new(
      accounts: accounts.map { |account| AccountResponseBuilder.new(account).call }
    )
  end
end
