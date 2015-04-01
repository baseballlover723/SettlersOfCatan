require 'minitest/autorun'
require File.expand_path('../../../app/models/board', __FILE__)

module Catan
    class TestBoard < Minitest::Test
        def setup
            @hexList = []
            @hexList << Catan::Hex.new(3, [3,2], :ore, ["left", "right"])
            @hexList << Catan::Hex.new(6, [1,1], :wool, ["left"])
            @hexList << Catan::Hex.new(3, [3,2], :ore, ["left", "right"])
            
            @game = Catan::Game.new(true, 2)
            @players = "Will be an array of Player objects"
        end
        
        def test_that_board_instantiates
            board = Catan::Board.new(@hexList, @game, @players)
            assert_instance_of Board, board
        end
    end
end