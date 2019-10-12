# frozen_string_literal: true

require 'bundler/setup'
require 'hanami/setup'
require 'hanami/model'
require 'hanami/middleware/body_parser'
require_relative './load_protos'
require_relative '../lib/bookshelf'

Hanami.configure do
  middleware.use Hanami::Middleware::BodyParser, :json

  if Hanami.app?(:api)
    require_relative '../apps/api/application'
    mount Api::Application, at: '/'
  end

  model do
    adapter :sql, ENV.fetch('DATABASE_URL')
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  mailer do
    root 'lib/bookshelf/mailers'

    delivery :test
  end

  environment :development do
    logger level: :info
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []

    mailer do
      delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    end
  end
end
