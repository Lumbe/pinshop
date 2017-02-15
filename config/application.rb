require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Pinshop
  class Application < Rails::Application
    config.after_initialize do
      ActionView::Base.default_form_builder = FormBuilderExtension
    end

    config.i18n.enforce_available_locales = true
    config.autoload_paths << Rails.root.join("app/support")

    config.quiet_assets = true

    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.fixture_replacement :factory_girl
    end

    config.action_controller.action_on_unpermitted_parameters = :raise
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_job.queue_adapter = :delayed_job
  end
end

Raven.configure do |config|
  config.dsn = 'https://5f7da1fb333f456da9523f71b0827c30:2f15e6074a9748388fc335c25abd61c0@sentry.io/138585'
  config.filter_parameters << :password
end