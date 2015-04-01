module Catan
    class Board
        attr_reader :hexes, :players, :game, :dice
        attr_accessor :currentTurn
        
        def initialize(hexes, game, players)
            @hexes = hexes
            @game = game
            @players = players
            @currentTurn = 1
        end
        
        def incrementTurn
            if (@currentTurn == 4)
                @currentTurn = 1
            else
                @currentTurn += 1 
            end
        end
    end
end