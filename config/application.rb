require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Lex
  class Application < Rails::Application
    config.autoload_paths = Dir["#{config.root}/lib"]
    config.autoload_paths.each { |path| config.eager_load_paths << path }
    config.console = Pry
    config.filter_parameters += [:password]
    config.session_store :cookie_store, key: '_lex_session'
    config.action_dispatch.cookies_serializer = :json
  end
end
