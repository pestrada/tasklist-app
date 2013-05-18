require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @task = Task.new
  end
  
  test 'description should be valid' do
    @task.description = ''
    assert @task.save == false
    
    @task.description = nil
    assert @task.save == false
  end
  
  test 'status should be valid' do
    @task.status = ''
    assert @task.save == false
    
    @task.status = nil
    assert @task.save == false
  end
  
end
