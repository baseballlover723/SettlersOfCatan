require 'minitest/autorun'
require File.expand_path('../../../app/models/game', __FILE__)

module Catan
    class TestGame < Minitest::Test
        def setup
            Catan::Game.clear
            
            @players = []
            @players << Catan::Player.new("Collin")
            @players << Catan::Player.new("Joe")
            @players << Catan::Player.new("Austin")
            @players << Catan::Player.new("James")
        end
        
        def test_that_game_ids_increment
            game1 = Catan::Game.new(true, 0, @players)
            assert_equal "bO", game1.id
            
            game2 = Catan::Game.new(true, 0, @players)
            assert_equal "m6", game2.id
        end
        
        def test_that_games_can_be_retrieved_by_string
            game1 = Catan::Game.new(true, 0, @players)
            assert_equal "bO", game1.id
            
            game2 = Catan::Game["bO"]
            
            assert_equal(game1, game2)
        end
        
        def test_that_games_can_be_retrieved_by_int
            game1 = Catan::Game.new(true, 0, @players)
            assert_equal "bO", game1.id
            
            game2 = Catan::Game[0]
            
            assert_equal(game1, game2)
        end
        
        def test_that_games_can_be_finished
            game1 = Catan::Game.new(true, 0, @players)
            assert_equal "bO", game1.id
            
            game1.finish
            
            game2 = Catan::Game["bO"]
            
            assert_nil game2
        end
        
        def test_that_game_ids_do_not_decrement
            game1 = Catan::Game.new(true, 0, @players)
            assert_equal "bO", game1.id
            
            game1.finish()
            
            game2 = Catan::Game.new(true, 0, @players)
            assert_equal "m6", game2.id
        end
        
        def test_that_game_has_board
            game1 = Catan::Game.new(false, 0, @players)
            
            assert_equal false, game1.board.game.isPrivate
            
            game2 = Catan::Game.new(true, 0, @players)
            
            assert_equal true, game2.board.game.isPrivate
        end
        
        # test after player class is implemented
        def test_that_game_has_players
            game = Catan::Game.new(false, 0, @players)
            
            assert_equal "Collin", game.players[0].name
            assert_equal "Joe", game.players[1].name
            assert_equal "Austin", game.players[2].name
            assert_equal "James", game.players[3].name
        end
        
        def test_that_game_has_exactly_four_players
            playerList = []
            err = assert_raises(ArgumentError) {Catan::Game.new(false, 0, playerList)}
            assert_equal "Exactly four players must participate, we received 0", err.message
            
            playerList << Catan::Player.new("George")
            err = assert_raises(ArgumentError) {Catan::Game.new(false, 0, playerList)}
            assert_equal "Exactly four players must participate, we received 1", err.message
            
            playerList << Catan::Player.new("Mike")
            playerList << Catan::Player.new("Eddy")
            err = assert_raises(ArgumentError) {Catan::Game.new(false, 0, playerList)}
            assert_equal "Exactly four players must participate, we received 3", err.message
            
        end
    end
end