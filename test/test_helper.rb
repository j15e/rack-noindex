require 'bundler/setup'

require 'rack/noindex'
require 'rack/lint'
require 'rack/mock'
require 'rack/test'
require 'contest'

class UnitTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    body = StringIO.new "foo"
    app = lambda do |env|
      [200, {"Content-type" => "test/plain", "Content-length" => "3"}, body]
    end
  end
end