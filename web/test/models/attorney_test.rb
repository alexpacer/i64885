require 'test_helper'

class AttorneyTest < ActiveSupport::TestCase
  test "should get all attorney" do
    assert_equal 2, Attorney.count, "All Attorney should be 2"
  end

  test "should create attorney" do
    attorney = Attorney.new
    attorney.name = "Name"
    assert attorney.save
  end

  test "should not create attorney without name" do
    attorney = Attorney.new
    assert_not attorney.save
  end

end
