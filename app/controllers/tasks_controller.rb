class TasksController < ApplicationController
  respond_to :html
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      respond_with @task
    else
      flash[:notice] = 'Task description should not be empty'
      respond_with @task, status: :unprocessable_entity
    end
  end
  
  def index
    @tasks = Task.all
  end
end
