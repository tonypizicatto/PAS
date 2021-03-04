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
    # @user_task = User.find(params[:id])
  end

  #zadachi usera, kolvo vipolnenih zadach usera, kolvo taskov v proektah, kolichestvo zakritih i otkritih zadach
end
