require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  
  test "new" do
    get :new
    assert_response :success
    assert_not_nil assigns[:task]
  end
  
  test "create" do
    assert_difference "Task.count", 1 do
      post :create, task: { description: 'sample_task' }
    end
    
    assert_redirected_to tasks_path
  end
  
  test "responds with error message when create fails" do
    post :create, task: { description: '' }
    assert_response :unprocessable_entity
    assert flash[:notice] == 'Task description should not be empty'
  end
  
  test "index" do
    Task.create(description: 'sample_task')
    get :index
    assert_response :success
    assert_not_nil assigns[:tasks]
  end
  
end
