module Spreader
  # This class Spreads the Vote response body into different methods.
  class Votes
    # Initializes the votes class
    # @param obj [Object] JSON parsed object
    def initialize(obj)
      @obj = obj
    end

    # Get raw hash return of the object
    # @return [Hash]
    attr_reader :obj

    # Get the first vote amongst all the other votes.
    # @return [Spreader::User]
    def first
      Spreader::User.new(@obj[0])
    end

    # Get the total number of votes
    # @return [Integer]
    def total
      @obj.length
    end
  end
end