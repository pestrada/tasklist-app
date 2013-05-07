require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  
  test "do not save a task without description" do
    task = Task.new
    assert !task.save, 'description is empty'
  end
  
end
