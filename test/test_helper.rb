require 'bundler/setup'

require 'rack/noindex'
require 'rack/lint'
require 'rack/mock'
require 'rack/test'
require 'contest'

class UnitTest < Test::Unit::TestCase
  include Rack::Test::Methods
end