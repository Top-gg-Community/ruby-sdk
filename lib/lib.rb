# frozen_string_literal: true
require 'faraday'
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
    @conn =  Faraday.new(
      url: 'https://top.gg/api',
      headers: { 'authorization' => @token }
    )
  end

  # The method fetches bot statistics from top.gg
  # @param id [String] The id of the bot you want to fetch statistics from.
  # @return [Spreader::Bot] The Bot Object
  def getBot(id)
    resp = @conn.get("bots/#{id}")

    Spreader::Bot.new(JSON.parse(resp.body))
  end

  # The method searches bots from top.gg using a keyword query.
  # @param query [String] the search term
  # @param limit [Integer] the amount of results to return
  # @param offset [Integer] The Amount of bots to skip
  # @param sort [Boolean] The fields to sort by.
  # @return [Spreader::BotSearch] The BotSearch Object
  def searchBot(query, limit: 50, offset: 0, sort: nil, fields: nil)
    resp = @conn.get('bots', { search: query, limit: limit, offset: offset, sort: sort, fields: fields })
    Spreader::BotSearch.new(JSON.parse(resp.body))
  end

  # Search for a user on top.gg with id
  # @param id [String] The id of the user to search for.
  # @return [Spreader::User]
  def user(id)
    resp = @conn.get("users/#{id}")

    Spreader::User.new(JSON.parse(resp.body))
  end

  # Get Bot statistics.
  # @param id [String] Id of the bot you want to get statistics of
  # @return [Spreader::Stats]
  def getStats(id)
    resp = @conn.get("bots/#{id}/stats")

    Spreader::Stats.new(JSON.parse(resp.body))
  end

  # Mini-method to query if the bot(self) was voted by the user.
  # @param userid [String] The user id.
  # @return [Boolean]
  def voted?(userid)
    resp = @conn.get("bots/#{@id}/check", { userId: userid })

    ret = JSON.parse(resp.body)
    ret['voted'] == 1
  end

  # Get the Last 1000 votes of the bot(self)
  # @return [Spreader::Votes]
  def votes
    resp = @conn.get("bots/#{@id}/votes")

    Spreader::Votes.new(JSON.parse(resp.body))
  end

  # Post Bot Statistics to the website
  # @param server_count [Integer] The amount of servers the bot is in.
  # @param shards [Integer] The amount of servers the bot is in per shard
  # @param shard_count [Integer] The total number of shards.
  def postStats(server_count, shards: nil, shard_count: nil)
    jsonPost = {
      server_count: server_count,
      shards: shards,
      shard_count: shard_count
    }.to_json
    @conn.post("bots/#{@id}/stats", jsonPost, { 'Content-Type' => 'application/json' })
  end

  # Autopost stats on to the top.gg website
  # @param client [Discordrb::Bot] instanceof discordrb client.
  def autoPostStats(client)
    serverLen = client.servers.length
    interval 1800 do
      postStats(serverLen)
    end
  end
  # Mini-method to get statistics on self
  # @return [getBot]
  def self
    getBot(@id)
  end

  def interval(seconds)
    loop do
      yield
      sleep seconds
    end
  end
end


