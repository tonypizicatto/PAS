class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :destroy, :update]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @team.update(team_params)
      redirect_to @team
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
