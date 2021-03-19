class UserController < ApplicationController

  def show
    @user = current_user
  end

  class RegistrationsController < Devise::RegistrationsController
  end
end
