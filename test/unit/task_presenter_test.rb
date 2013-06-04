require 'test_helper'

class TaskPresenterTest < ActiveSupport::TestCase
  
  def setup
    tasks = tasks(:task1)
    @presenter = TaskPresenter.new(tasks)
  end
  
  test '#title' do
    assert @presenter.title == 'Tasks'
  end
  
  test '#no_tasks_message' do
    assert @presenter.no_tasks_message == "You don't have any pending tasks. Great!"
  end
end