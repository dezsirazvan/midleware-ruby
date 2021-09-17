require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Midle
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.middleware.insert(0, Rack::ReverseProxy) do
      reverse_proxy_options preserve_host: false
      # reverse_proxy_options force_ssl: true, replace_response_host: true
      reverse_proxy '/', 'https://104.22.68.176:443'
      # reverse_proxy '/', 'http://82.78.94.148:80'
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
