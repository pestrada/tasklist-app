class TaskPresenter
  
  attr_reader :tasks
  
  def initialize(tasks)
    @tasks = tasks
  end
  
  def title
    'Tasks'
  end
  
  def no_tasks_message
    "You don't have any pending tasks. Great!"
  end
  
end