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
            @currentTurn += 1 
        end
    end
end