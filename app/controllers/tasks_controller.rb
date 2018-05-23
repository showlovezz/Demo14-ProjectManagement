class TasksController < ApplicationController

  before_action :find_project

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "小任務被刪除了"
    else
      flash[:error] = "小任務被刪除不成功"
    end
    redirect_to @project
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params[:task].permit(:content)
  end

end
