# rack-noindex

> Rack middleware to add X-Robots-Tag: noindex on a given condition.

[![Build Status](https://travis-ci.org/j15e/rack-noindex.png?branch=master)](https://travis-ci.org/j15e/rack-noindex)

## Usage

```ruby
# config.ru

# Default condition for noindex on *.herokuapp.com
use Rack::Noindex

# or set custom condition
use Rack::Noindex, lambda { |env| env['SERVER_NAME'] =~ /\.herokuapp\.com$/ }
```