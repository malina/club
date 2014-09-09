require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Orderclub
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :mini_test, :spec => true, :fixture => false
    end
    
    ## COMPASS'S config
    config.compass.images_dir = '/public'

    ## I18n config
    config.i18n.default_locale = :ru
  end
end
