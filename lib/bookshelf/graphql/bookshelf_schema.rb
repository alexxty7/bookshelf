# frozen_string_literal: true

require_relative 'types/mutation_type'
require_relative 'types/query_type'

class BookshelfSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
