class Task < ActiveRecord::Base
  attr_accessible :description, :status
  
  validates :description, presence: true
  validates :status, presence: true
  
  def change_status(new_status)
    case new_status
    when 'finished'
      self.status = new_status
    end
  end
end
