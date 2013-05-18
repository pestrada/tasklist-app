class StatusesController < ApplicationController
  
  def update
    @task = Task.find(params[:task_id])
    @task.change_status params[:status]
    puts @task.inspect
    if @task.save
      redirect_to tasks_path
    else
      flash[:notice] = 'There was an error updating the task.'
    end
  end
end