require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  
  test "creates a new task" do
    get :new
    assert_response :success
    assert_not_nil assigns[:task]
  end
  
end
