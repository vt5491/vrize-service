# config/initializers/cors.rb
Rails.application.config.middleware.insert_before 0, Rack::Cors do
=begin
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
  allow do
    origins 'https://localhost:4200'
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
  allow do
    origins /172\.31\.\d{1,3}\.\d{1,3}/
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end
  allow do
    origins 'http://127.0.0.1:4200'
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end
  allow do
    origins 'http://0.0.0.0'
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
  end
  # a catch-all that should only be used for debugging.
#  allow do
#    origins '*'
#    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]
#  end
=end
  allow do
    origins 'localhost:3000', '127.0.0.1:3000', '0.0.0.0:3000',
      /\Ahttp:\/\/192\.168\.0\.\d{1,3}(:\d+)?\z/,
      /172\.31\.\d{1,3}\.\d{1,3}/

    # regular expressions can be used here
    resource '*', headers: :any, methods: [:get, :post, :options, :put, :delete]

#    resource '/file/list_all/', :headers => 'x-domain-token'
#    resource '/file/at/*',
#      :methods => [:get, :post, :delete, :put, :patch, :options, :head],
#      :headers => 'x-domain-token',
#      :expose  => ['Some-Custom-Response-Header'],
#      :max_age => 600
#    # headers to expose
  end
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options]
  end
end
