# Top.gg Ruby

This Software Development Kit provides you with a wrapper to the top.gg api, that allows you 
to fetch data from the top.gg api and post data such as statistics to the website.

## Dependencies

* Ruby 
* Faraday (The client to automate requests)

## Installation



## Example

Here's a straightforward example of how to request data with the wrapper.

```ruby
require 'topgg'

client = Topgg.new("AUTH_TOKEN", "BOTID")

client.getBot("1234").defAvatar
# returns
# "6debd47ed13483642cf09e832ed0bc1b"

```
### AutoPosting

The wrapper provides you with autoposting functionality
with the wrapper posting bot statistics every 30 minutes.
Here's how you can enable it

```ruby
require 'topgg'
require 'discordrb'

bot = Discordrb::Bot.new token: "TOKEN"

client = Topgg.new("AUTH_TOKEN", "BOTID")
 bot.ready do |event|
 client.autoPostStats(bot) # The discordrb bot client.
end
bot.run
```

# Documentation

Check out the documentation [here](https://rubydoc.info/gems/topgg/)
