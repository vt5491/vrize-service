# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # Note: it appears you must manually cycle the rails server in order for it
  # to pick up on cors changes.
  # allow do
  #   # origins 'localhost:4200'
  #   p "VRIZE_SERVICE_CORS_ORIGINS=#{ENV['VRIZE_SERVICE_CORS_ORIGINS']}"
  #   origins ENV['VRIZE_SERVICE_CORS_ORIGINS'].split(',').map { |origin| origin.strip }
  #   resource '*',
  #     headers: :any,
  #     methods: %i(get post put patch delete options head)
  # end
  allow do
    origins 'http://localhost:4200'
    # resource '/api/*', headers: :any, methods: [:get, :post, :options, :put, :delete]
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end
  #
  # allow do
  #   # origins 'http://192.168.1.143:4200'
  #   origins 'http://192.168.1.143'
  #   resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  # end
  allow do
    # origins '*'
    # origins '192.168.1.143'
    # origins '192.168.1.*'
    # origins /192\.168\.1\.\d{1,3}/
    origins /192\.168\.\d{1,3}\.\d{1,3}/
    # resource '/api/*', headers: :any, methods: [:get, :post, :options, :put, :delete]
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end
end
