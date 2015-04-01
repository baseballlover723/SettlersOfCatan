module Catan
    class Board
        attr_reader :players, :game, :dice
        attr_accessor :currentTurn, :activeDice, :rollNumber, :hexes
        
        def initialize(game, players)
            @hexes = []
            @game = game
            @players = *players
            @currentTurn = 1
            @activeDice = false
            # initially 0 so the first roll to decide who plays
            # first will always be greater than rollNumber
            @rollNumber = 0
            
            #ensure exactly 4 players
            if (@players.length != 4)
                raise ArgumentError, "Exactly four players must participate, we received #{@players.length}" 
            end
        end
        
        def incrementTurn
            if (@currentTurn == 4)
                @currentTurn = 1
            else
                @currentTurn += 1 
            end
        end
        
        def rollDice
            roll1 = 1 + rand(6)
            roll2 = 1 + rand(6)
            @rollNumber = roll1 + roll2
        end
    end
end