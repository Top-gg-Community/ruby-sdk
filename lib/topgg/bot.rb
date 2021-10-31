module Dbl
  # The Bot class spreads the json parsed hash into different methods
  class Bot
    # Initializes the Bot class
    # @param obj [Object]
    def initialize(obj)
      @obj = obj
    end
    # Returns raw hash of the parsed json object
    # @return [Hash]
    attr_reader :obj

    alias :raw :obj

    alias data obj
    # Returns error message, if there's an error
    # @return [String]
    def error
      @obj['error'].to_str
    end

    # Returns the default Avatar of the client
    # @return [String]
    def defAvatar
      @obj['defAvatar'].to_str
    end

    # Returns the invite link of the bot
    # @return [String]
    def invite
      @obj['invite'].to_str
    end

    # Returns the bot website, if configured
    # @return [String]
    def website
      @obj['website'].to_str
    end

    # Returns support server link
    # @return [String]
    def support
      "https://discord.gg/#{@obj['support']}"
    end

    # Returns github repository link, if any
    # @return [String]
    def github
      @obj['github'].to_str
    end

    # Returns the long Description of the bot
    # @return [String]
    def longdesc
      @obj['longdesc'].to_str
    end

    # Returns the short description of the bot
    # @return [String]
    def shortdesc
      @obj['shortdesc'].to_str
    end

    # Returns the default prefix of the bot
    # @return [String]
    def prefix
      @obj['prefix'].to_str
    end

    # Returns the bot library
    # @return [String]
    def lib
      @obj['lib'].to_str
    end

    # Returns the bot client id
    # @return [String]
    def clientid
      @obj['clientid'].to_str
    end

    # Returns the avatar link of the bot
    # @return [String]
    def avatar
      "https://cdn.discordapp.com/avatars/#{@obj['id']}/#{@obj['avatar']}.webp?size=1024"
    end

    # Returns the bot id
    # @return [String]
    def id
      @obj['id'].to_str
    end

    # Returns the bot descriminator
    # @return [String]
    def descriminator
      @obj['descriminator'].to_str
    end

    # Returns the bot username
    # @return [String]
    def username
      @obj['username'].to_str
    end

    # Returns the date on which the bot was submitted
    # @return [Date]
    def date
      Date.parse(@obj['date'])
    end

    # Returns the server count of the bot
    # @return [Integer]
    def server_count
      @obj['server_count'].to_i
    end

    # Returns the amount of shards
    # @return [String]
    def shard_count
      @obj['shard_count'].to_str
    end

    # Returns configured guilds in which the bot is in
    # @return [String]
    def guilds
      @obj['guilds'].to_str
    end 

    # Returns the amount of guilds per shard of the bot
    # @return [String]
    def shards
      @obj['shards'].to_str
    end

    # Returns the monthyPoints of the bot
    # @return [String]
    def monthlyPoints
      @obj['monthlyPoints'].to_str
    end

    # Returns the total points of the bot
    # @return [String]
    def points
      @obj['points'].to_str
    end

    # Returns true/false depending on if the bot is certified or not
    # @return [Boolean]
    def certifiedBot
      @obj['certifiedBot'].to_str
    end

    # Returns the owner ids
    # @return [Array<String>]
    def owners
      @obj['owners'].to_str
    end

    # Return the bot tags
    # @return [Array<String>]
    def tags
      @obj['tags'].to_str
    end

    # Returns the bot banner url
    # @return [String]
    def bannerUrl
      @obj['bannerUrl'].to_str
    end

    # Returns the donate bot guild ID
    # @return [String]
    def donatebotguildid
      @obj['donatebotguildid'].to_str
    end
  end
end
