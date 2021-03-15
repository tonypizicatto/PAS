require 'rails_helper'

RSpec.describe ProjectsController do

  describe "render templates" do

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "renders the create template" do
      post :create
      expect(response).to render_template(:create)
    end

    it "renders the edit template" do
      get :edit
      expect(response).to render_template(:edit)
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template(:show)
    end

    it "renders the update template" do
      put :update
      expect(response).to render_template(:update)
    end

    it "renders the destroy template" do
      delete :destroy
      expect(response).to render_template(:destroy)
    end

  end
end