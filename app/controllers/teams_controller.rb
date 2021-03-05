class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :destroy, :update]
  before_action :check_permissions

  def index
    authorize! :show, @teams
    @teams = Team.all
  end

  def new
    authorize! :create, @team
    @team = Team.new
  end

  def create
    authorize! :create, @team
    @team = Team.create(team_params)
    if @team.save
      redirect_to @team
    else
      render :new
    end
  end

  def edit
    authorize! :edit, @team
  end

  def show
    authorize! :show, @team
  end

  def update
    authorize! :update, @team
    if @team.update(team_params)
      redirect_to @team
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, @team
    @team.destroy
    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end

  def check_permissions
    redirect_to dashboard_no_access_path unless current_user.admin?
  end

end
