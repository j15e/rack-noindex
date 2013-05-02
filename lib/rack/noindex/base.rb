module Rack
  module Noindex
    class Base
      def initialize(app, &condition)
        @app = app
        @conditon = condition
      end

      def call(env)
        status, headers, response = @app.call(env)
        headers['X-Robots-Tag'] = 'noindex'
        [status, headers, response]
      end
    end
  end
end