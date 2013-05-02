require File.expand_path('../test_helper', __FILE__)

class HeadersTest < UnitTest

  def app
    body = StringIO.new "foo"
    app = lambda do |env|
      [200, {"Content-type" => "test/plain", "Content-length" => "3"}, body]
    end
  end

  def noindex(app)
    condition = lambda { |env| env['HOSTNAME'] == 'www.indexed.com' }
    Rack::Lint.new(Rack::Noindex.new(app, condition))
  end

  def test_default
    request = Rack::MockRequest.env_for("/")
    response = noindex(app).call(request)
    assert_equal nil, response[1]["X-Robots-Tag"]
  end

  def test_no_index
    request = Rack::MockRequest.env_for("/", {'HOSTNAME' => 'www.indexed.com'})
    response = noindex(app).call(request)
    assert_equal 'noindex', response[1]["X-Robots-Tag"]
  end

end