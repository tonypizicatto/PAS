require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  describe 'assotiations' do
    it { expect(project).to respond_to(:teams) }
    it { expect(project).to respond_to(:tasks) }
    it { expect(project).to respond_to(:comments) }
    it { expect(project).to respond_to(:users) }
  end
end
