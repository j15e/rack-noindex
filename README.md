# rack-noindex

> Rack middleware to add X-Robots-Tag: noindex on a given condition.

## Usage

```ruby
# config.ru
use Rack::Noindex, Proc.new { |env| env['HOSTNAME'] != 'www.indexed.com' }
```