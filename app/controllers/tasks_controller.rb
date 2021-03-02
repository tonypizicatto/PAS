class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:index, :new, :show, :edit, :destroy, :update, :create]
  before_action :set_task, only: [:show, :edit, :destroy, :update]

  def index
    @tasks = @project.tasks.page(params[:page])
  end

  def new
    @task = @project.tasks.build
  end

  def create
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to project_tasks_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @comments = @task.comments.page(params[:page])
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :status, :content, :start_date, :due_date, :estimation, :project_id, :user_id)
  end

end

