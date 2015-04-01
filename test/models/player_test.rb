require 'minitest/autorun'
require File.expand_path('../../../app/models/player', __FILE__)

module Catan
    class TestPlayer < Minitest::Test
        
        def setup
        
        end
        
        def test_that_player_initializes
            player = Catan::Player.new("Collin Trowbridge")
            
            assert_instance_of Player, player
            assert_equal "Collin Trowbridge", player.name
        end
    end
end