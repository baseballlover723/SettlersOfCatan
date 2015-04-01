require "hashids"

module Catan
    class Game
        attr_reader :isPrivate, :board
        @@hashids = Hashids.new "catan"
        @@games = {}
        @@gameCounter = 0
        
        def initialize(isPrivate, turnLimit, playerList)
            @id = @@gameCounter
            @@gameCounter += 1
            @isPrivate = isPrivate
            @turnLimit = turnLimit
            @@games[@id] = self
            @playerList = playerList
            @board = Catan::Board.new(self, @playerList)
        end
        
        def id
            @@hashids.encode(@id)
        end
        
        # Retrieve a Game by its numeric id or its hashid
        def self.[](id)
            if id.is_a? String
                @@games[@@hashids.decode(id).first]
            else
                @@games[id]
            end
        end
        
        def self.clear
            @@games.clear
            @@gameCounter = 0
        end
        
        # Finish a Game and remove it from the queue
        def finish()
            @@games.delete(@id)
        end
    end
end