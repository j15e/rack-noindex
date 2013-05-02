require File.expand_path('../test_helper', __FILE__)

class DefaultsTest < UnitTest

  def noindex(app)
    Rack::Lint.new(Rack::Noindex.new(app))
  end

  def test_default
    request = Rack::MockRequest.env_for("/", {'SERVER_NAME' => 'www.myapp.com'})
    response = noindex(app).call(request)
    assert_equal nil, response[1]["X-Robots-Tag"]
  end

  def test_default_no_index
    request = Rack::MockRequest.env_for("/", {'SERVER_NAME' => 'myapp.herokuapp.com'})
    response = noindex(app).call(request)
    assert_equal 'noindex', response[1]["X-Robots-Tag"]
  end

end