# Method Chainable

The idea here is easy chaining of methods on classes or objects in Ruby. Primarily it routes output from one method to the next
![Screenshot](https://image.ibb.co/miSA9Q/chain_link_hi.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'method_chainable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install method_chainable

## Usage

Consider this simple example

```ruby
class Simpleton
  include MethodChainable

  def foo
    'Foo'
  end

  def bar(n)
    n + 'Bar'
  end
end

# Without chaining
s = Simpleton.new
s.bar(s.foo) # FooBar

# With chaining(You should call .val to get the final result)
Simpleton.new.chain.foo.bar.val # FooBar
```

## Contributing

1. Fork it ( https://github.com/abhisheksarka/method_chainable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
