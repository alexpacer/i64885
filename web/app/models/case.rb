class Case < ActiveRecord::Base
  validates :attorney_id, presence: true
  validates :issue_id, presence: true
end
