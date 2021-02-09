class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @user = current_user
  end

  def new

  end

  def create

  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end
end
