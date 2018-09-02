require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rack/cors"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FraveOne
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.generators do |g|
      # don't generate helper files
      g.helper = false
      # don't generate coffeescript and scss files
      g.assets = false
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'frave-react.herokuapp.com'
        # 'origin' option specifies the domains that are allowed to make cross
        # origin requests to our Rails server
        resource(
          '/api/v1/*', 
          headers: :any, 
          credentials: true, # allows cookies to be sent across origins or 
          # with fetch
          methods: [:get, :post, :delete, :patch, :put, :options]
        )
        # 'resource' option specifies which urls we will be allowed to perform
        # CORS on. Above, we say that all urls that begin with "/api/v1/" are
        # allowed.
      end
    end
    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', :headers => :any, :methods => [:get, :post, :delete, :patch, :put, :options]
    #   end
    # end

    config.action_dispatch.default_headers = { 'Access-Control-Allow-Origin' => 'https://frave-react.herokuapp.com', 'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",") }

  end
end
# 'localhost:3002', 'localhost:3001', 