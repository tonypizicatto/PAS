RSpec.describe ProjectsController do
  context "when user logged in" do
    let(:user) { create(:user) }
    let(:project) { create(:project, user_id: user.id) }

    before do
      sign_in(user)
    end

    describe "#index" do
      before { get :index, params: { user_id: user.id } }

      it { expect(response).to render_template(:index) }
      it { expect(assigns(:projects)).to include(project) }
    end

    describe "#new" do
      before { get :new, params: { user_id: user.id } }

      it { expect(response).to render_template(:new) }
      it { expect(assigns(:project).new_record?).to be_truthy }
    end

    describe "#create" do
      let(:parameters) do
        {
          project: attributes_for(:project).merge(user_id: user.id)
        }
      end
      subject { post :create, params: parameters }

      it { is_expected.to be_redirect }

      context 'when project is invalid' do
        before { parameters[:project][:start_date] = nil }

        it { is_expected.to render_template(:new) }
      end
    end

    describe "#edit" do
      before { get :edit, params: { id: project.id, user_id: user.id } }

      # it "returns incorrect status" do
      #   expect{ get :edit }.to raise_error(CanCan::AccessDenied)
      # end

      context "when user admin" do
        let(:user) { create(:user, :admin) }

        it { expect(response).to render_template(:edit) }
        it { expect(assigns(:project)).to eq(project) }
      end

    end

    describe "#show" do
      before { get :show, params: { id: project.id, user_id: user.id } }

      it { expect(response).to render_template(:show) }
      #komments show?
      it { expect(assigns(:project)).to eq(project) }
    end

    describe "#update" do
      let(:name) { "lolita" }
      # let(:project) { create(:project, user_id: user.id) }
      let(:parameters) do
        {
          project: { name: name, user_id: user.id }
        }.merge(id: project.id)
      end
      before { put :update, params: parameters }
      # before { put :update, params: { name: name, id: project.id } }

      it { expect(project.reload.name).to eq(name) }
      it { expect(response).to be_redirect }

      context 'when project is invalid' do
        let(:name) { nil }

        it { expect(response).to render_template(:edit) }
      end
    end

    describe "#destroy" do
      before do
        delete :destroy, params: { project_id: project.id, id: project.id }
        sign_in(user)
      end

      # it { expect(:destroy).to raise(CanCan::AccessDenied) }

      describe "when user admin" do
        let(:user) { create(:user, :admin) }

        before do
          sign_in(user)
        end

        it { expect(response).to be_redirect }
        it { expect(assigns(:project)).to eq(project) }
      end
    end
  end
end