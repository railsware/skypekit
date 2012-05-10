# Skypekit

Ruby FFI interface to libskypekit C library

## Dependencies

* libskypekit C library
* ffi gem

## Installation

Install [libskypekit](https://github.com/railsware/libskypekit).

Add this line to your application's Gemfile:

    gem 'skypekit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skypekit

## Usage

Check examples directory.

Run ping_pong example:

    SK_KEY=bla.pem SK_USER=user SK_PASS=secret be ruby examples/ping_pong.rb

## Author

* Andriy Yanko

## Contributors

* Volodymyr Bezobiuk
* Alexey Vasiliev

## License

* Copyright (c) 2012 Railsware (www.railsware.com)
* [MIT](www.opensource.org/licenses/MIT)

## References

* [libskypekit](https://github.com/railsware/libskypekit)
* [SkypeKit C++ Wrapper Reference](http://developer.skype.com/skypekit/reference/cpp/index.html)
