module Catan
    class Hex
        attr_reader :rollNumber, :position, :resourceGiven
        attr_accessor :surroundingHex, :hasRobber, :takenLocations
        
        def initialize(rollNumber, position, resourceGiven, surroundingHex)
            @rollNumber = rollNumber
            @position = position
            @resourceGiven = resourceGiven
            @surroundingHex = surroundingHex
            # pass in the constructor?
            @hasRobber = false
            @takenLocations = []
        end
        
        
    end     
end