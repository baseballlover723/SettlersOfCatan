require 'minitest/autorun'
require File.expand_path('../../../app/models/location', __FILE__)

module Catan
    class TestLocation
        
        def setup
        
        end
        
        def test_initialize_location
            location = Catan::Location.new(true)
            assert_instance_of Location, location
        end
    end
end