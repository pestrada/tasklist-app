require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  
  test "creates a new task" do
    get :new
    assert_response :success
    assert_not_nil assigns[:task]
  end
  
  test "saves a new task" do
    assert_difference "Task.count", 1 do
      post :create, task: { description: 'sample_task' }
    end
    
    assert_response :success
  end
  
end
