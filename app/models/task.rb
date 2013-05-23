class Task < ActiveRecord::Base
  attr_accessible :description, :status
  
  validates :description, presence: true
  validates :status, presence: true
  
  def pending?
    status == 'pending'
  end
  
  def finished?
    status == 'finished'
  end
  
  def cancelled?
    status == 'cancelled'
  end
end