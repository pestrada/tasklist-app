require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @user = users(:user1)
    sign_in :user, @user
  end
  
  test '#update' do
    task = tasks(:task1)
    put :update, task_id: task.id, status: { status: 'finished' }
    assert_response :success
  end
end