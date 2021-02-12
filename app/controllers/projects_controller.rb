class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :destroy, :update]
  PROJECTS = current_user.projects

  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit

  end

  def show

  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end
end

private

def set_project
  @project = Project.find(params[:id])
end

def project_params
  params.require(:project).permit(:name, :summary, :start_date, :end_date, :user_id)
end