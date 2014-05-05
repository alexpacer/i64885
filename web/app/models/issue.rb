class Issue < ActiveRecord::Base
  validates :victim_id, presence: true
end
