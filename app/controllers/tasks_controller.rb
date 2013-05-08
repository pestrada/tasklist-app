class TasksController < ApplicationController
  respond_to :html
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to tasks_path
    else
      flash[:notice] = 'Task description should not be empty'
      respond_with @task, status: :unprocessable_entity
    end
  end
  
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Task succesfully destroyed'
    end
  end
  
end
