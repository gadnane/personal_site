class ProjectsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show] 
  
  def index
  	@projects = Project.all
  end

  def show
    @project = Project.friendly.find(params[:id])
  end

  def edit
	@project = Project.friendly.find(params[:id])
  end

  def update
    @project = Project.friendly.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

def new
  	@project = Project.new
  end

def create
  	@project = Project.new(project_params)
    if @project.save
      	flash[:success] = "Project Created"
      	redirect_to @project
    else
      	render 'projects/new'
    end
  end

 def destroy
    Project.friendly.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end


  private

    def project_params
      params.require(:project).permit(:title, :description, :link, :slug)
    end

end
