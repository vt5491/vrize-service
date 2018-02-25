require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VrizeService
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #vt add
    # make timestamps in the db be local time not gmt.
    config.active_record.default_timezone = :local

    # try to make it so when we access this service from a remote machine we don't
    # get cors issues
    # vt: you can only add one route here.  To add others update 'application_controller.rb'
    config.action_dispatch.default_headers = {
      # 'Access-Control-Allow-Origin' => 'http://my-web-service-consumer-site.com',
      # Note: you need to specify the address of the client, not that of the rails server
      'Access-Control-Allow-Origin' => 'http://localhost:4200',
      'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }
    #vt end
  end
end
