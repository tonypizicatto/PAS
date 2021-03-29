describe CommentsController do
  context "when user logged in" do
    let(:comment) { create(:project_comment) }
    let(:user) { comment.user }

    before do
      sign_in(user)
    end

    describe "#create" do
      let(:project) { create(:project) }
      let(:parameters) do
        { comment: { commentable_type: 'Project', commentable_id: project.id, content: '123', user_id: user.id } }
      end
      subject { get :create, params: parameters }

      it { is_expected.to be_redirect }

      context 'when comment is invalid' do
        let(:parameters) { { comment: { commentable_type: 'Project', commentable_id: project.id, user_id: user.id } } }

        it { is_expected.to be_redirect }
      end
    end

    describe "#show" do
      subject { get :show, params: { id: comment.id } }

      it { is_expected.to render_template(:show) }
    end
  end
end