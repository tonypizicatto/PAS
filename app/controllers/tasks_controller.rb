class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(project_params)
    if @tasks.save
      redirect_to @tasks
    else
      render :new
    end
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
