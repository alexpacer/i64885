require 'test_helper'

class IssueTest < ActiveSupport::TestCase

  test "should get all issuies" do
    assert_equal 2, Issue.count, "Expected to get 2 of #{Issue.count} issuies"
  end

  test "should create issue" do
    issue = Issue.new
    issue.victim_id = 1
    assert issue.save, "Issue saved with victim_id"
  end

  test "should create issue without victim_id" do
    issue = Issue.new
    assert_not issue.save, "Issue saved without victim_id"
  end
end
