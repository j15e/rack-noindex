require 'rack/noindex'
require 'rack/utils'

module Rack
  module Noindex
    class Base
      extend Rack::Utils

      def initialize(app, condition)
        @app = app
        @condition = condition
      end

      def call(env)
        status, headers, response = @app.call(env)
        headers['X-Robots-Tag'] = 'noindex' if @condition.call(env)
        [status, headers, response]
      end
    end
  end
end