# frozen_string_literal: true
module Dbl
  # The User class, used for Spreading the response body into different methods
  class User
    # Instantiates the class variables
    # @param obj [Object] Response Data Object
    def initialize(obj)
      @obj = obj
    end

    attr_reader :obj

    alias raw obj

    alias data obj
    # Check for errors, if any
    def error
      @obj['error']
    end

    # The Id of the user
    def id
      @obj['id']
    end

    # The username of the user
    def username
      @obj['username']
    end

    # The avatar of the user
    # @return [String]
    def avatar
      "https://cdn.discordapp.com/avatars/#{@obj['id']}/#{@obj['avatar']}.webp?size=1024"
    end

    # The default avatar of the user
    # @return [String]
    def defAvatar
      @obj['defAvatar']
    end

    # Returns true/false depending upon if the user is a moderator or not.
    # @return [Boolean]
    def mod
      @obj['mod']
    end

    # Returns true/false depending upon if the user is a supporter or not.
    # @return [Boolean]
    def supporter
      @obj['supporter']
    end

    # Returns true/false depending upon if the user is a certified developer or not.
    # @return [Boolean]
    def certifiedDev
      @obj['certifiedDev']
    end

    # Returns an object containing all user social integrations.
    # @return [Object]
    def social
      @obj['social']
    end

    # Returns true/false depending on weather the user is an admin or not.
    # @return [Boolean]
    def admin
      @obj['admin']
    end

    # Returns true/false depending on weather the user is a website Moderator or not.
    # @return [Boolean]
    def webMod
      @obj['webMod']
    end
  end
end
