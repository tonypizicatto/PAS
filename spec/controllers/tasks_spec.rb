RSpec.describe TasksController do
  context "when user logged in" do
    let(:task) { create(:task) }
    let(:project) { task.project }
    let(:user) { task.user }

    before do
      sign_in(user)
    end

    describe "#index" do
      before { get :index, params: { project_id: project.id } }

      it { expect(response).to render_template(:index) }
      it { expect(assigns(:tasks)).to include(task) }
    end

    describe "#new" do
      before { get :new, params: { project_id: project.id } }

      it { expect(response).to render_template(:new) }
      it { expect(assigns(:task).new_record?).to be_truthy }
    end

    describe "#create" do
      let(:parameters) do
        {
          task: attributes_for(:task).except(:project, :user).merge(user_id: user.id)
        }.merge(project_id: project.id)
      end
      subject { post :create, params: parameters }

      it { is_expected.to be_redirect }

      context 'when task is invalid' do
        before { parameters[:task][:title] = nil }

        it { is_expected.to render_template(:new) }
      end
    end

    describe "#edit" do
      before { get :edit, params: { project_id: project.id, id: task.id } }

      it { expect(response).to render_template(:edit) }
      it { expect(assigns(:project)).to eq(project) }
      it { expect(assigns(:task)).to eq(task) }
    end

    describe "#show" do
      before { get :show, params: { project_id: project.id, id: task.id } }

      it { expect(response).to render_template(:show) }
      #komments show?
      it { expect(assigns(:project)).to eq(project) }
    end

    describe "#update" do
      let(:title) { "lolita" }
      let(:parameters) do
        {
          task: { title: title, user_id: user.id }
        }.merge(project_id: project.id, id: task.id)
      end

      before { put :update, params: parameters }

      it { expect(task.reload.title).to eq(title) }
      it { expect(response).to be_redirect }

      context 'when task is invalid' do
        let(:title) { nil }
        it { expect(response).to render_template(:edit) }
      end
    end

    describe "#destroy" do
      before do
        delete :destroy, params: { project_id: project.id, id: task.id }
        sign_in(user)
      end

        let(:project) { create(:project) }
        let(:user) { create(:user, :admin) }
        let(:task) { create(:task_without_user, user: user, project: project) }

        before do
          sign_in(user)
        end

        it { expect(response).to be_redirect }
        it { expect(assigns(:project)).to eq(project) }
        it { expect(assigns(:task)).to eq(task) }
    end
  end
end