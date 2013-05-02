# rack-noindex

> Rack middleware to add X-Robots-Tag: noindex on a given condition.

## Usage

```ruby
# config.ru
use Rack::Noindex, lambda { |env| env['HOSTNAME'] != 'www.indexed.com' }
```