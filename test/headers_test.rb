require File.expand_path('../test_helper', __FILE__)

class HeadersTest < UnitTest

  def noindex(app)
    Rack::Lint.new(Rack::Noindex.new(app))
  end

  def test_no_index
    body = StringIO.new "foo"
    app = lambda do |env|
      [200, {"Content-type" => "test/plain", "Content-length" => "3"}, body]
    end
    request = Rack::MockRequest.env_for("/")
    response = noindex(app).call(request)
    assert_equal 'noindex', response[1]["X-Robots-Tag"]
  end

end