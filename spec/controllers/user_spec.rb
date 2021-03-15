require 'rails_helper'

RSpec.describe UserController do

  # let(:user) { build(:user) }
  # it "assigns @user" do
  #   get :index
  #   expect(assigns(:user)).to eq([user])
  # end

  describe "render templates" do

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
end

end