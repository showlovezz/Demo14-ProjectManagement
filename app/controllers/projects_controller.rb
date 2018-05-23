class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update]

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
      render 'new'
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(params_project)
      flash[:notice] = "修改此內容成功"
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  private

  def params_project
  	params.require(:project).permit(:title, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
