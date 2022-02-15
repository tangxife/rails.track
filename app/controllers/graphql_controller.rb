class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session
  skip_forgery_protection

  before_action :set_auth_info_for_graphiql,   if: -> { Rails.env.development? }
  after_action  :cache_auth_info_for_graphiql, if: -> { Rails.env.development? }

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]

    # context = {
    #   # Query context goes here, for example:
    #   # current_user: current_user,
    # }
    context = gql_devise_context(User)
    p "authenticated user: #{context[:current_resource].inspect}"
    # p context[:current_resource]
    result = AppSchema.execute(query, variables: variables, context: gql_devise_context(User),
                               operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end

  @@_cached_local_auth_headers = {}

  def cache_auth_info_for_graphiql
    if request_from_graphiql?
      auth_headers = response.headers.slice("access-token", "client", "uid")
      @@_cached_local_auth_headers = auth_headers unless auth_headers.empty?
    end
  end

  def set_auth_info_for_graphiql
    if request_from_graphiql?
      @@_cached_local_auth_headers.each do |k, v|
        request.headers[k.to_sym] = v
      end
    end
  end

  def request_from_graphiql?
    request.origin.in?(ENV["GRAPHIQL_URL_LIST"].split(","))
  end
end
