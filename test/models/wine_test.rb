require 'test_helper'

class WineTest < ActiveSupport::TestCase

    wine = Wine.new

    test "a wine with no properties is invalid" do
        assert wine.invalid? # empty wine should fail
    end

    test "price of wine should be positive" do
        wine.price = -1
        assert wine.invalid?, "negative prices shouldn't work"

        wine.price = 0
        assert wine.invalid?, "wines shouldn't be free"
    end

    test "price of wine should only have two decimal places" do
        wine.price = 0.001
        assert wine.invalid?
    end

    test "invalid countries should fail" do
        wine.origin = "XX" # permanently reserved code
        assert wine.invalid?

        wine.origin = "Belgium" # must be ISO 3166-2
        assert wine.invalid?
    end
end
