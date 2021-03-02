class User::TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    if request.post?
      @tasks = current_user.tasks.where(user_tasks_params).page(params[:page])
    else
      @tasks = current_user.tasks.page(params[:page])
    end
  end

  private

  def user_tasks_params
    params.require('/user/tasks').permit!
  end

end

