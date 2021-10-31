# frozen_string_literal: true

require_relative 'topgg/utils/request'
require 'json'
require_relative 'topgg/bot'
require_relative 'topgg/botSearch'
require_relative 'topgg/user'
require_relative 'topgg/stats'
require_relative 'topgg/votes'
# Class Topgg
# The class instantiates all the methods for api requests and posts.
class Topgg
  # initializes the class attributes.
  # @param token [String] The authorization token from top.gg
  # @param id [String]  The client id of the bot.
  def initialize(token, id)
    @id = id
    @token = token
    @request = Dbl::Utils::Request.new(token)
  end

  # The method fetches bot statistics from top.gg
  # @param id [String] The id of the bot you want to fetch statistics from.
  # @return [Dbl::Bot] The Bot Object
  def get_bot(id)
    resp = @request.get("bots/#{id}")

    Dbl::Bot.new(resp)
  end

  # The method searches bots from top.gg using a keyword query.
  # @param [Object] params The parameters that can be used to query a search
  # To know what the parameters are check it out here
  # @return [Dbl::BotSearch] The BotSearch Object
  def search_bot(params)
    resp = @request.get('bots/search', params)
    Dbl::BotSearch.new(resp)
  end

  # Search for a user on top.gg with id
  # @param id [String] The id of the user to search for.
  # @return [Dbl::User]
  def user(id)
    resp = @request.get("users/#{id}")

    Dbl::User.new(resp)
  end

  # Get Bot statistics.
  # @param id [String] Id of the bot you want to get statistics of
  # @return [Dbl::Stats]
  def get_stats(id)
    resp = @request.get("bots/#{id}/stats")

    Dbl::Stats.new(resp)
  end

  # Mini-method to query if the bot(self) was voted by the user.
  # @param userid [String] The user id.
  # @return [Boolean]
  def voted?(userid)
    resp = @request.get("bots/#{@id}/check", { userId: userid })

    ret = resp
    ret['voted'] == 1
  end

  # Get the Last 1000 votes of the bot(self)
  # @return [Dbl::Votes]
  def votes
    resp = @request.get("bots/#{@id}/votes")

    Dbl::Votes.new(resp)
  end

  # Post Bot Statistics to the website
  # @param server_count [Integer] The amount of servers the bot is in.
  # @param shards [Integer] The amount of servers the bot is in per shard
  # @param shard_count [Integer] The total number of shards.
  def post_stats(server_count, shards: nil, shard_count: nil)
    json_post = {
      server_count: server_count,
      shards: shards,
      shard_count: shard_count
    }.to_json
    @request.post("bots/#{@id}/stats", json_post, { 'Content-Type' => 'application/json' })
  end

  # Auto-posts stats on to the top.gg website
  # @param client [Discordrb::Bot] instanceof discordrb client.
  def auto_post_stats(client)
    semaphore = Mutex.new
    Thread.new do
      semaphore.synchronize do
        interval 1800 do
          server_len = client.servers.length
          post_stats(server_len)
          print("[TOPGG] : \033[31;1;4m Bot statistics has been successfully posted!\033[0m")
        end
      end
    end
  end

  # Mini-method to get statistics on self
  # @return [get_bot]
  def self
    get_bot(@id)
  end

  def interval(seconds)
    loop do
      yield
       sleep seconds
    end
  end
end




