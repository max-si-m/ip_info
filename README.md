# IpInfo Gem

[![Build Status](https://travis-ci.org/max-si-m/ip_info.svg?branch=master)](https://travis-ci.org/max-si-m/ip_info)

Find location from an IP address. 
This's simple gem for [http://ipinfodb.com/](http://ipinfodb.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipinfo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipinfo

## Usage
Use your api key for site, you can get it [here](http://ipinfodb.com/account.php)
Api key also can be stored in environment variable `ENV['IP_INFO_KEY']`.
```ruby
ip_info = IpInfo::API.new()   
```
And use `#lookup` for geting information about *ip*:

```ruby
ip_info.lookup('209.85.227.104', type: 'city', time_zone: true)
```
or *domain*:

```ruby
ip_info.lookup('devbattles.com', type: 'country')
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/ipinfo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
