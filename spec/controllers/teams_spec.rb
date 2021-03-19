RSpec.describe TeamsController do
  context "when user logged in" do
    let(:team) { create(:team) }
    let(:user) { create(:user, team_id: team.id) }

    before do
      sign_in(user)
    end

    describe "#index" do
      before do
        get :index, params: { team_id: team.id }
        sign_in(user)
      end
      it { expect(response).to_not render_template(:index) }
      describe "when user admin" do
        let(:user) { create(:user, :admin, team_id: team.id) }

        before do
          sign_in(user)
        end

        before { get :index, params: { team_id: team.id } }

        it { expect(response).to render_template(:index) }
        it { expect(assigns(:teams)).to include(team) }
      end
    end

    describe "#new" do
      context 'when user not admin' do
        it { expect(response).to_not render_template(:new) }
      end

      describe "when user admin" do
        let(:user) { create(:user, :admin, team_id: team.id) }

        before do
          sign_in(user)
        end

        before { get :new, params: { team_id: team.id } }

        it { expect(response).to render_template(:new) }
        it { expect(assigns(:team).new_record?).to be_truthy }
      end
    end

    describe "#show" do
      context 'when user not admin' do
        it { expect(response).to_not render_template(:show) }
      end

      describe "when user admin" do
        let(:user) { create(:user, :admin, team_id: team.id) }

        before do
          sign_in(user)
          get :show, params: { id: team.id }
        end

        it { expect(response).to render_template(:show) }
        it { expect(assigns(:team)).to eq(team) }

      end
    end

    describe "#create" do
      let(:parameters) do
        {
          team: attributes_for(:team).merge(user_ids: [])
        }
      end
      subject { post :create, params: parameters }

      it { is_expected.to be_redirect }

      context 'when team is invalid' do
        let(:user) { create(:user, :admin, team_id: team.id) }
        before { parameters[:team][:name] = nil }

        it { is_expected.to render_template(:new) }
      end
    end

    describe "#edit" do
      context 'when user not admin' do
        it { expect(response).to_not render_template(:edit) }
      end

      describe "when user admin" do
        let(:user) { create(:user, :admin, team_id: team.id) }
        before { get :edit, params: { id: team.id } }

        it { expect(response).to render_template(:edit) }
        it { expect(assigns(:team)).to eq(team) }
      end
    end

    describe "#update" do
      let(:team) { create(:team) }
      let(:name) { "lolita" }
      let(:parameters) do
        {
          team: { name: team.name }
        }
      end

      before do
        sign_in(user)
        put :update, params: { id: team.id, team: { name: name } }
      end

      context "when user not admin" do
        it { expect(team.reload.name).to_not eq(name) }
      end

      context "when user admin" do
        let(:user) { create(:user, :admin, team_id: team.id) }

        it { expect(team.reload.name).to eq(name) }
      end

      context 'when team is invalid' do
        let(:name) { nil }
        let(:user) { create(:user, :admin, team_id: team.id) }

        it { expect(response).to_not render_template(:update) }

      end
    end

    describe "#destroy" do
      before do
        delete :destroy, params: { id: team.id }
        sign_in(user)
      end
      context 'when user not admin' do
        it { expect(response).to_not render_template(:index) }
      end

      describe "when user admin" do
        let(:team) { create(:team) }
        let(:user) { create(:user, :admin) }

        before do
          sign_in(user)
        end

        it { expect(response).to be_redirect }
        it { expect(assigns(:team)).to eq(team) }
      end
    end
  end
end