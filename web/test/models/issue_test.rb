require 'test_helper'

class IssueTest < ActiveSupport::TestCase
  test "Should create issue" do
    issue = Issue.new
    issue.victim_id = 1
    assert issue.save, "Issue saved with victim_id"
  end

  test "Should create issue without victim_id" do
    issue = Issue.new
    assert_not issue.save, "Issue saved without victim_id"
  end
end
