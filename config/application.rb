require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ScreendoorPublicGallery
  class Application < Rails::Application
    # Autoload /lib classes
    config.autoload_paths << Rails.root.join('lib')

    # Manually bump assets
    config.assets.version = 'v1'

    # Add fonts to asset pipeline
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.assets.precompile += %w(
      .svg .eot .woff .ttf
    )

    config.active_record.raise_in_transactional_callbacks = true

    config.action_dispatch.rescue_responses.merge!(
      'ActionController::ParameterMissing' => :unprocessable_entity
    )

    config.x.site_title = 'Screendoor Public Gallery'
    config.x.ga_id = 'XX'
    config.x.screendoor_embed_token = ENV.fetch('SCREENDOOR_EMBED_TOKEN')
    config.x.screendoor_api_key = ENV.fetch('SCREENDOOR_API_KEY')
  end
end
