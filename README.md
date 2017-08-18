# rack-noindex

> Rack middleware to add X-Robots-Tag: noindex header on a given condition.

[![Build Status](https://travis-ci.org/j15e/rack-noindex.svg?branch=master)](https://travis-ci.org/j15e/rack-noindex)
[![Gem Version](https://badge.fury.io/rb/rack-noindex.svg)](https://rubygems.org/gems/rack-noindex)
[![Code Climate](https://codeclimate.com/github/j15e/rack-noindex.svg)](https://codeclimate.com/github/j15e/rack-noindex)

## Usage

```ruby
# config.ru

# By default it adds noindex header for domain matching `*.herokuapp.com`
use Rack::Noindex

# Set a custom condition using rack env and a lambda block :
use Rack::Noindex, lambda { |env| env['SERVER_NAME'] =~ /\.herokuapp\.com$/ }
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details on contributing and running test.

## Credits

Made for fun and public development environments by [@j15e](https://github.com/j15e).
