require 'rails_helper'

RSpec.describe CommentsController do

  describe "render templates" do

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "renders the create template" do
      post :create
      expect(response).to render_template(:create)
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template(:show)
    end

  end
end