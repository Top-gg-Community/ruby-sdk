# [Top.gg](https://top.gg) Ruby

The Top.gg Ruby SDK is a lighweight package, that allows you 
to fetch data from the top.gg api and post data such as statistics to the website.

It provides you with numerous methods to interact with the API.
## Dependencies

* Ruby 

## Installation

``` bash

gem install topgg

```
## Note

You require a Token to interact with the Api.
The token can be found at `https://top.gg/bot/[YOUR_BOT_ID]/webhooks` 

## Example

Here's a straightforward example of how to request data with the wrapper.

```ruby
require 'topgg'

client = Topgg.new("AUTH_TOKEN", "BOTID")

client.get_bot("1234").defAvatar
# returns
# "6debd47ed13483642cf09e832ed0bc1b"

```
### Auto Posting

The library provides you with autoposting functionality, and autoposts at an interval of 30 minutes.
Here's how you can use it

```ruby
require 'topgg'
require 'discordrb'

bot = Discordrb::Bot.new token: "TOKEN"

client = Topgg.new("AUTH_TOKEN", "BOTID")
 bot.ready do |event|
 client.auto_post_stats(bot) # The discordrb bot client.
end
bot.run
```

# Documentation

Check out the api reference [here](https://rubydoc.info/gems/topgg/)
