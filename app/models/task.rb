class Task < ActiveRecord::Base
  attr_accessible :description, :status
  
  validates :description, presence: true
  validates :status, presence: true
end
