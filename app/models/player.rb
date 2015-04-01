module Catan
    class Player
        attr_reader :name, :hand, :devCards
        
        # possibly pass client parameter
        def initialize(name)
            @name = name
            @hand = []
            @devCards = []
        end
    end
end