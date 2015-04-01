require 'minitest/autorun'
require File.expand_path('../../../app/models/game', __FILE__)

module Catan
    class TestGame < Minitest::Test
        def setup
            Catan::Game.clear
        end
        
        def test_that_game_ids_increment
            game1 = Catan::Game.new(true, 0)
            assert_equal "bO", game1.id
            
            game2 = Catan::Game.new(true, 0)
            assert_equal "m6", game2.id
        end
        
        def test_that_games_can_be_retrieved_by_string
            game1 = Catan::Game.new(true, 0)
            assert_equal "bO", game1.id
            
            game2 = Catan::Game["bO"]
            
            assert_equal(game1, game2)
        end
        
        def test_that_games_can_be_retrieved_by_int
            game1 = Catan::Game.new(true, 0)
            assert_equal "bO", game1.id
            
            game2 = Catan::Game[0]
            
            assert_equal(game1, game2)
        end
        
        def test_that_games_can_be_finished
            game1 = Catan::Game.new(true, 0)
            assert_equal "bO", game1.id
            
            game1.finish
            
            game2 = Catan::Game["bO"]
            
            assert_nil game2
        end
        
        def test_that_game_ids_do_not_decrement
            game1 = Catan::Game.new(true, 0)
            assert_equal "bO", game1.id
            
            game1.finish()
            
            game2 = Catan::Game.new(true, 0)
            assert_equal "m6", game2.id
        end
        
        def test_that_game_has_board
            game1 = Catan::Game.new(false, 0)
            
            assert_equal false, game1.board.game.isPrivate
            
            game2 = Catan::Game.new(true, 0)
            
            assert_equal true, game2.board.game.isPrivate
        end
    end
end