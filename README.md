# Ozonetel - REST API to interact with Ozonetel KooKoo

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ozonetel'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ozonetel

## Usage

 **Configure authentication key and version**

  Add following lines into your rails application.rb file

  Ozonetel.configure do |c|
    c.outbound_version = 2
    c.api_key = 'xxxxxxxxxxxxxxx'
  end

 **To send outbound call**

 response = Ozonetel::Outbound::Call.connect({:phone_no => 'The phone number to place the call to', :extra_data => 'Your KooKoo Tunes', :caller_id => 'Your ozonetel caller id', :url => 'Your application url', :callback_url => 'URL which will be called after the call is finished.'})

 Example - 1
 response = Ozonetel::Outbound::Call.connect({:phone_no => "xxxxxxxxxx", :extra_data =>"<response><playtext>ILove KooKoo</playtext><hangup/></response>"})

 puts response.status

 "queued"

 puts response.message

 "136989181721681"

 Example 2 -
 response = Ozonetel::Outbound::Call.connect({:phone_no => "9643919931", :extra_data =>"<response><playtext>ILove KooKoo</playtext><hangup/></response>"})

 puts response.status

 "error"

 puts response.message

 "Authentication error"

## Dependencies

 gem httparty 0.14.0

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ashugodia/ozonetel.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

