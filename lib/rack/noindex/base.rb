require 'rack/noindex'

module Rack
  module Noindex
    class Base
      def initialize(app, condition)
        if condition.nil?
          condition = lambda { |env| env['SERVER_NAME'] =~ /\.herokuapp\.com$/ }
        end
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