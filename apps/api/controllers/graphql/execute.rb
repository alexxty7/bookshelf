# frozen_string_literal: true

module Api
  module Controllers
    module Graphql
      class Execute
        include Api::Action

        params do
          required(:query) { filled? & str? }
        end

        def call(params)
          halt 400 unless params.valid?

          result = ::BookshelfSchema.execute(
            params[:query],
            variables: ensure_hash(params[:variables]),
            context: {},
            operation_name: params[:operationName]
          )
          status 200, result.to_json
        end

        private

        # Handle form data, JSON body, or a blank value
        def ensure_hash(ambiguous_param) # rubocop:disable Metrics/MethodLength
          case ambiguous_param
          when String
            if ambiguous_param.present?
              ensure_hash(JSON.parse(ambiguous_param))
            else
              {}
            end
          when Hash, Hanami::Action::Params
            ambiguous_param
          when nil
            {}
          else
            raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
          end
        end
      end
    end
  end
end
