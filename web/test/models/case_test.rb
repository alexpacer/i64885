require 'test_helper'

class CaseTest < ActiveSupport::TestCase
  test "should not create case without attorney_id and issue_id" do
    c = Case.new
    assert_not c.save, "created case without attorney_id and issue_id"
  end
end
