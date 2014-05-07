class Attorney < ActiveRecord::Base
  validates :name, presence: true
end
