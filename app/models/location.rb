# will add more to the constructor parameters
# we should talk more about design so we can start building this project!
module Catan
    class Location
        attr_reader :owner, :isOwned, :adjacentLocations, :position
        
        def initialize(isOwned)
            @isOwned = isOwned
        end
    end
end