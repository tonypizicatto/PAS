require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }

  describe 'assotiations' do
    it { expect(task).to respond_to(:user) }
    it { expect(task).to respond_to(:project) }
    it { expect(task).to respond_to(:comments) }
  end
end
