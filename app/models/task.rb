class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :status, presence: true
  
  default_scope { order('created_at DESC') }
  
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