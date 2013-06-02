class TaskPresenter
  
  attr_reader :tasks
  
  def initialize(tasks)
    @tasks = tasks
  end
  
  def title
    'Tasks'
  end
  
end