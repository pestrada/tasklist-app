require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  test "task description should not be empty" do
    task = Task.new
    task.description = ''
    assert task.save == false
  end
  
  test "task description should not be nil" do
    task = Task.new
    task.description = nil
    assert task.save == false
  end
  
end
