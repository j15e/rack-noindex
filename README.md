# rack-noindex

> Rack middleware to add X-Robots-Tag: noindex on a given condition.

[![Build Status](https://travis-ci.org/j15e/rack-noindex.png?branch=master)](https://travis-ci.org/j15e/rack-noindex)
[![Gem Version](https://badge.fury.io/rb/rack-noindex.png)](https://rubygems.org/gems/rack-noindex)
[![Dependency Status](https://gemnasium.com/j15e/rack-noindex.png)](https://gemnasium.com/j15e/rack-noindex)
[![Code Climate](https://codeclimate.com/github/j15e/rack-noindex.png)](https://codeclimate.com/github/j15e/rack-noindex)

## Usage

```ruby
# config.ru

# Default condition for noindex on *.herokuapp.com
use Rack::Noindex

# or set custom condition
use Rack::Noindex, lambda { |env| env['SERVER_NAME'] =~ /\.herokuapp\.com$/ }
```