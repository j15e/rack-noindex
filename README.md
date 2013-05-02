# rack-noindex

> Rack middleware to add X-Robots-Tag: noindex on a given condition.

## Usage

```ruby
# config.ru
use Rack::Noindex, lambda { |env| env['SERVER_NAME'] != 'www.indexed.com' }
```