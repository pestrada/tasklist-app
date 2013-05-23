class Task < ActiveRecord::Base
  attr_accessible :description, :status
  
  validates :description, presence: true
  validates :status, presence: true
  
  def change_status(new_status)
    unless cancelled?
      if pending? || finished?
        self.status = new_status
      end
    end
  end
  
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