require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  def setup
    @task = tasks(:task1)
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
  
  test '#change_status' do
    @task.change_status 'finished'
    assert @task.status == 'finished'
    
    @task.change_status 'cancelled'
    assert @task.status == 'cancelled'
  end
  
  test '#pending' do
    assert @task.pending?
    
    @task.status = 'finished'
    assert @task.finished?
    
    @task.status = 'cancelled'
    assert @task.cancelled?
  end
  
end
