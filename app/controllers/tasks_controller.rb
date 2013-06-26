class TasksController < ApplicationController
  respond_to :html, :js
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(valid_params)
    if @task.save
      redirect_to tasks_path
    else
      flash[:notice] = 'Task description should not be empty'
      respond_with @task, status: :unprocessable_entity
    end
  end
  
  def index
    if params[:all] == 'true'
      tasks = Task.all
    else
      tasks = Task.where('status = ?', 'pending')
    end
    @presenter = TaskPresenter.new(tasks)
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes valid_params
      redirect_to tasks_path
    else
      flash[:notice] = 'Task description should not be empty'
      respond_with @task, status: :unprocessable_entity
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      respond_with @task
    end
  end
  
  private
  
  def valid_params
    params[:task].permit(:description, :status)
  end
  
end
