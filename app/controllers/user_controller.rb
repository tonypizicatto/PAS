class UserController < ApplicationController
  def new
  end

  def index 
    @user = current_user
  end

  class RegistrationsController < Devise::RegistrationsController
  end
end
