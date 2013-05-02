require File.expand_path('../test_helper', __FILE__)

class ConditionTest < UnitTest

  def noindex(app)
    condition = lambda { |env| env['SERVER_NAME'] != 'www.exemple.io' }
    Rack::Lint.new(Rack::Noindex.new(app, condition))
  end

  def test_custom
    request = Rack::MockRequest.env_for("/", {'SERVER_NAME' => 'www.exemple.io'})
    response = noindex(app).call(request)
    assert_equal nil, response[1]["X-Robots-Tag"]
  end

  def test_custom_no_index
    request = Rack::MockRequest.env_for("/")
    response = noindex(app).call(request)
    assert_equal 'noindex', response[1]["X-Robots-Tag"]
  end

end