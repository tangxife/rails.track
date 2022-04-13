# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    allowed_origins = ENV["ALLOWED_ORIGINS"].to_s.split(/,\s*/)
    # Origins can be specified as a string, a regular expression, or as '*' to allow all origins.
    origins(*allowed_origins)
    # A Resource path can be specified as exact string match (/path/to/file.txt) or with a '*' wildcard (/all/files/in/*). A resource can take the following options:
    #
    # methods (string or array or :any): The HTTP methods allowed for the resource.
    # headers (string or array or :any): The HTTP headers that will be allowed in the CORS resource request. Use :any to allow for any headers in the actual request.
    # expose (string or array): The HTTP headers in the resource response can be exposed to the client.
    # credentials (boolean, default: false): Sets the Access-Control-Allow-Credentials response header. Note: If a wildcard (*) origin is specified, this option cannot be set to true. Read this security article for more information.
    # max_age (number): Sets the Access-Control-Max-Age response header.
    # if (Proc): If the result of the proc is true, will process the request as a valid CORS request.
    # vary (string or array): A list of HTTP headers to add to the 'Vary' header.
    resource "/graphql", headers: :any, methods: [:get, :post, :option], credentials: true
  end
end
