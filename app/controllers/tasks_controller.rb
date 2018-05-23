class TasksController < ApplicationController

  before_action :find_project

  def create
    @task = @project.task.create(params_task)
    redirect_to @project
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def params_task
    params.require(:task).permit(:content)
  end

end
