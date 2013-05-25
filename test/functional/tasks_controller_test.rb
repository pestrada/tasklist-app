require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @user = users(:user1)
    sign_in :user, @user
  end
  
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
    task = tasks(:task1)
    get :index
    assert_response :success
    assert_not_nil assigns[:tasks]
  end
  
  test "show" do
    task = tasks(:task1)
    get :show, id: task.id
    
    assert_response :success
  end
  
  test "delete" do
    task = tasks(:task1)
    assert_difference "Task.count", -1 do
      delete :destroy, id: task.id
    end
    
    assert_redirected_to tasks_path
  end
  
  test "edit" do
    task = tasks(:task1)
    get :edit, id: task.id
    assert_response :success
  end
  
  test "update" do
    task = tasks(:task1)
    put :update, id: task.id, task: { description: 'new description' }
    assert_redirected_to task_path(task)
    
    put :update, id: task.id, task: { status: 'finished' }
    assert_redirected_to task_path(task)
  end
  
  test "responds with error message when update fails" do
    task = tasks(:task1)
    put :update, id: task.id, task: { description: '' }

    assert flash[:notice] == 'Task description should not be empty'
    assert_response :unprocessable_entity
  end
  
end
