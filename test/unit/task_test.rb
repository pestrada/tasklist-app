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
  
  test '#pending' do
    assert @task.pending?
  end
  
  test '#finished' do
    @task.status = 'finished'
    assert @task.finished?
  end
  
  test '#cancelled' do
    @task.status = 'cancelled'
    assert @task.cancelled?
  end
  
end
