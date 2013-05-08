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
  
  test "show" do
    task = Task.create(description: 'sample_task')
    get :show, id: task.id
    
    assert_response :success
  end
  
  test "delete" do
    task = Task.create(description: 'sample_task')
    assert_difference "Task.count", -1 do
      delete :destroy, id: task.id
    end
    
    assert flash[:notice] == 'Task succesfully destroyed'
    assert_response :success
  end
  
  test "edit" do
    task = Task.create(description: 'sample_task')
    get :edit, id: task.id
    assert_response :success
  end
  
  test "update" do
    task = Task.create(description: 'sample_task')
    put :update, id: task.id, task: { description: 'new description' }
    
    assert_redirected_to task_path(task)
  end
  
  test "responds with error message when update fails" do
    task = Task.create(description: 'sample_task')
    put :update, id: task.id, task: { description: '' }

    assert flash[:notice] == 'Task description should not be empty'
    assert_response :unprocessable_entity
  end
  
end
