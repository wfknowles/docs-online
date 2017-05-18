require_relative 'boot'

require 'rails/all'

require File.expand_path('../boot', __FILE__)

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsDevisePundit
  class Application < Rails::Application
   config.assets.initialize_on_precompile = false
    config.web_console.whiny_requests = false
    config.web_console.whitelisted_ips = '10.240.0.0/32'
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.to_prepare do
      # Configure single controller layout
      Devise::SessionsController.layout "standard"
      Devise::SessionsController.layout "standard"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "standard" }
      Devise::ConfirmationsController.layout "standard"
      Devise::UnlocksController.layout "standard"
      Devise::PasswordsController.layout "standard"
    end

   config.active_record.raise_in_transactional_callbacks = true

    # use structrue.sql because schema.rb does not show love for JSON storage
   config.active_record.schema_format = :sql
  end
end
