# frozen_string_literal: true
module Dbl
  # This class spreads the BotSearch Response body into different methods
  class BotSearch
    # Initalizes the BotSearch class
    # @param obj [Object] Response Hash
    def initialize(obj)
      @obj = obj
    end
    # Get raw hash response
    # @return [Hash]
    attr_reader :obj
    
    alias raw obj

    alias data obj

    # The Total number of results
    # @return [Integer]
    def total
      @obj['total'].to_i
    end

    # The first result
    # @return [Spreader::Bot]
    def first
      Spreader::Bot.new(@obj['results'][0])
    end

    # The number of bots shown in the first page
    # @return [Integer]
    def count
      @obj['count'].to_i
    end

    # Iterates through the results
    # @return [Array<Spreader::Bot>]
    def results
      arr = []
      flag = 0 # iteration flag
      @obj['results'].each do |data|
        arr[flag] = Spreader::Bot.new(data)
        flag += 1
      end
      arr
    end

    # Length of the results.
    # @return [Integer]
    def size
      @obj['results'].length
    end
  end
end
