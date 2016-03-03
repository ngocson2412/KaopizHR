class ProjectsController < ApplicationController
  include ProjectsHelper
  
  def new
  	@project= Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
  	@projects = Project.all
  end

  def create
    @project = Project.new(project_params)    
    if @project.save
      flash[:success] = "Tao du an thanh cong!"
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project= Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Profile updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to projects_url
  end

  private 

  	def project_params
  		params.require(:project).permit(:project_name, :plan_time, :real_time)
  	end
end
