class Victim < ActiveRecord::Base
  validates :name, presence: true
end
