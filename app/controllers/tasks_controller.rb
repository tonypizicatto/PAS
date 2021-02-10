class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
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
