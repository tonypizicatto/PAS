class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_parametrs
  before_action :check_permissions

  def index
    authorize! :read, @projects
  end

  def all_users_tasks
    authorize! :read, @users
  end

  def tasks_in_projects
    authorize! :read, @projects
  end

  private

  def set_parametrs
    @projects = Project.all.page(params[:page])
    @users = User.all.page(params[:page])
  end

  def check_permissions
    redirect_to dashboard_no_access_path unless current_user.admin?
  end

end
