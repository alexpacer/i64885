require 'test_helper'

class VictimTest < ActiveSupport::TestCase

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
