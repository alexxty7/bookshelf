# frozen_string_literal: true

require 'hanami/interactor'

class PostAccount
  include Hanami::Interactor

  expose :account

  def call(request)
    @account = AccountRepository.new.create(name: request.name)
  end
end
