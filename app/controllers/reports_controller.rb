class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parametrs

  def index

  end

  def all_users_tasks

  end

  def tasks_in_projects

  end

  private

  def set_parametrs
    @projects = Project.all.page(params[:page])
    @users = User.all.page(params[:page])
  end

end
