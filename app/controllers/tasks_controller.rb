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
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes params[:task]
      redirect_to tasks_path
    else
      flash[:notice] = 'Task description should not be empty'
      respond_with @task, status: :unprocessable_entity
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path
    end
  end
  
end
