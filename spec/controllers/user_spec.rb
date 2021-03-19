RSpec.describe UserController do

  describe "#show" do
    let(:user) { create(:user) }

    before do
      sign_in(user)
      get :show, params: { id: user.id }
    end

    it { expect(response).to render_template(:show) }
    it { expect(assigns(:user)).to eq(user) }
  end

end