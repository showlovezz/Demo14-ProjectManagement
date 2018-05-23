class TasksController < ApplicationController

  before_action :find_project
  before_action :find_task, expect: [:create]

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    if @task.destroy
      flash[:success] = "小任務被刪除了"
    else
      flash[:error] = "小任務被刪除不成功"
    end
    redirect_to @project
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @project, notice: "Task Completed"
  end


  private

  def find_task
    @task = @project.tasks.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params[:task].permit(:content)
  end

end
