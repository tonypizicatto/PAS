require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  describe 'assotiations' do
    it { expect(comment).to respond_to(:user) }
    it { expect(comment).to respond_to(:commentable) }
    it { expect(comment).to respond_to(:comments) }
  end

end
