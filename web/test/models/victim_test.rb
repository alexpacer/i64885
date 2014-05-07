require 'test_helper'

class VictimTest < ActiveSupport::TestCase

  test "should get all victims" do
    assert_equal 2, Victim.count, "Victims should be 2 instead of #{victims.count}"
  end 

  test "should create victim" do
    victim = Victim.new
    victim.name = "New Victim"
    assert victim.save, "Saved victim"
  end

  test "should not create victim without name" do
    victim = Victim.new
    assert_not victim.save, "Saved victim without name"
  end

  
end
