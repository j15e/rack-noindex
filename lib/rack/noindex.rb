require 'rack/noindex/version'
require 'rack'

module Rack
  module Noindex
    autoload :Base, 'rack/noindex/base'

    def self.new(app)
      Rack::Builder.new do
        use ::Rack::Noindex::Base
        run app
      end.to_app
    end

  end
end