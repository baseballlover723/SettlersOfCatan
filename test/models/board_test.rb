require 'minitest/autorun'
require File.expand_path('../../../app/models/board', __FILE__)

module Catan
    class TestBoard < Minitest::Test
        def setup
            @game = Catan::Game.new(true, 2)
            @players = "Will be an array of Player objects"
        end
        
        def test_that_board_instantiates_properly
            board = Catan::Board.new(@game, @players)
            assert_instance_of Board, board
            
            board.hexes << Catan::Hex.new(3, [3,2], :ore, ["left", "right"])
            board.hexes << Catan::Hex.new(6, [1,1], :wool, ["left"])
            board.hexes << Catan::Hex.new(3, [2,4], :ore, ["left", "right"])
            
            assert_equal true, board.game.isPrivate
            assert_equal [2,4], board.hexes[2].position
        end
        
        def test_that_board_increments_turn
            board = Catan::Board.new(@game, @players)
            assert_equal 1, board.currentTurn
            
            board.incrementTurn
            assert_equal 2, board.currentTurn
            
            board.incrementTurn
            assert_equal 3, board.currentTurn
            
            board.incrementTurn
            assert_equal 4, board.currentTurn
            
            board.incrementTurn
            assert_equal 1, board.currentTurn
            
            board.incrementTurn
            assert_equal 2, board.currentTurn
        end
        
        def test_that_board_makes_dice_active
            board = Catan::Board.new(@game, @players)
            assert_equal false, board.activeDice
            
            board.activeDice = true
            assert_equal true, board.activeDice
            
            board.activeDice = false
            assert_equal false, board.activeDice
        end
        
        def test_that_board_rolls_dice
            board = Catan::Board.new(@game, @players)
            assert_equal 0, board.rollNumber
            
            # run rollDice method 100 times to be extra sure
            100.times do
                board.rollDice()
                assert_includes 2..12, board.rollNumber
            end
        end
        
        # test later
        def test_that_board_has_players
        end
    end
end