require 'minitest/autorun'
require File.expand_path('../../../app/models/hex', __FILE__)

module Catan
    class TestHex < Minitest::Test
        
        def setup
            
        end
        
        def test_get_hex_resource_type
           hex = Catan::Hex.new(3, [3,2], :ore, ["left", "right"])
           assert_equal :ore, hex.resourceGiven
           
           hex = Catan::Hex.new(3, [3,2], :wool, ["right"])
           assert_equal :wool, hex.resourceGiven
        end
        
        def test_get_hex_location
           hex = Catan::Hex.new(3, [3,2], :ore, ["up", "down"])
           assert_equal [3,2], hex.position
           
           hex = Catan::Hex.new(3, [1,0], :ore, ["up", "down"])
           assert_equal [1, 0], hex.position
        end
        
        def test_get_roll_number
            hex = Catan::Hex.new(3, [3,2], :ore, ["up", "down"])
            assert_equal 3, hex.rollNumber
            
            hex = Catan::Hex.new(6, [3,2], :ore, ["up", "down"])
            assert_equal 6, hex.rollNumber
        end
        
        def test_get_hex_surrounding_hexes
            hex = Catan::Hex.new(3, [3,2], :ore, ["up", "down"])
            assert_equal ["up", "down"], hex.surroundingHex
            
            hex = Catan::Hex.new(3, [3,2], :ore, ["left"])
            assert_equal ["left"], hex.surroundingHex
            
            hex = Catan::Hex.new(3, [3,2], :ore, [])
            assert_equal [], hex.surroundingHex
        end
        
        def test_set_hex_surrounding_hexes
            hex = Catan::Hex.new(3, [3,2], :ore, ["up", "down"])
            hex.surroundingHex = ["left"]
            assert_equal ["left"], hex.surroundingHex
            
            hex.surroundingHex = []
            assert_equal [], hex.surroundingHex
            
            hex.surroundingHex = ["left", "up", "right", "down"]
            assert_equal ["left", "up", "right", "down"], hex.surroundingHex
        end
        
        def test_hex_robber_is_initially_false
            hex = Catan::Hex.new(3, [3,2], :ore, ["up"])
            assert_equal false, hex.hasRobber
        end
        
        def test_hex_set_robber
            hex = Catan::Hex.new(3, [3,2], :wool, ["down"])
            assert_equal false, hex.hasRobber
            
            hex.hasRobber = true
            assert_equal true, hex.hasRobber
            
            hex.hasRobber = false
            assert_equal false, hex.hasRobber
        end
        
        def test_hex_taken_locations_initially_empty
            hex = Catan::Hex.new(3, [3,2], :wool, ["down"])
            assert_equal [], hex.takenLocations
        end
        
        def test_hex_add_to_taken_locations
            hex = Catan::Hex.new(3, [3,2], :ore, ["up"])
            hex.takenLocations << Catan::Location.new(true)
            
            assert_instance_of Location, hex.takenLocations[0]
            
            assert_equal true, hex.takenLocations[0].isOwned
        end
    end 
end