require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { build(:team) }

  describe 'assotiations' do
    it { expect(team).to respond_to(:projects) }
    it { expect(team).to respond_to(:users) }
  end
end
