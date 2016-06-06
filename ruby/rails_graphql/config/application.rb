require_relative 'boot'
$: << File.expand_path('../lib', __dir__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
require 'pass_auth_token'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsGraphql
  class Application < Rails::Application
    config.middleware.use PassAuthToken
    config.middleware.use Rack::JWT::Auth, {secret: 'super_secret_key', exclude: %w(/assets), options: { algorithm: 'HS256' }}

    config.autoload_paths << Rails.root.join('app/api')
    config.autoload_paths << Rails.root.join('app/lib')
    config.autoload_paths << Rails.root.join('app/api/mutations')
    config.autoload_paths << Rails.root.join('app/api/types')

    config.active_record.raise_in_transactional_callbacks = true

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.schema_format = :sql

    # Configure rails g to skip helper/assets files
    config.generators do |g|
      g.assets = false
      g.helper = false
      g.view_specs      false
      g.helper_specs    false
    end
  end
end
