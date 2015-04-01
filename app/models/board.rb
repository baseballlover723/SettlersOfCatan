module Catan
    class Board
        attr_reader :hexes, :players, :game, :dice
        
        def initialize(hexes, game, players)
            @hexes = hexes
            @game = game
            @players = players
        end
    end
end