require 'rack/noindex/version'
require 'rack'

module Rack
  module Noindex
    autoload :Base, 'rack/noindex/base'

    def self.new(app, condition)
      Rack::Builder.new do
        use ::Rack::Noindex::Base, condition
        run app
      end.to_app
    end

  end
end