class ProjectsController < ApplicationController

  def index
  	@projects = Project.all
  end

  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(params_project)
  	if @project.save
  		flash[:notice] = "建立成功"
  		redirect_to projects_path
  	else
  		flash[:alert] = "建立不成功"
  	end
  end

  private

  def params_project
  	params.require(:project).permit(:title, :description)
  end

end
