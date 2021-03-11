require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { build(:user) }

  describe '#downcase_email' do
    before { user.email = 'UPPERCASEDEMAIL@EMAIL.HUI' }
      it 'makes email downcased' do
        user.save
        expect(user.email).to eq('uppercasedemail@email.hui')
      end
  end

  describe '#VALID_EMAIL_REGEX' do
    before { user.email = 'UPPERCASEDEMAILEMAILHUI' }
    it 'check email valid' do
      user.save
      expect(user.errors).to_not be_empty
    end

  end

  describe '#name' do
    it 'check user full name'do
      expect(user.name).to eq(user.first_name + ' ' + user.last_name)
    end
  end

  describe '#team_name' do
    let(:user) { create(:user, team: team) }
    let(:team) { create(:team) }

    it 'check user full name'do
      expect(user.team_name).to eq(team.name)
    end

    context 'when user has no team' do
      let(:user) { create(:user) }

      it 'returns none if user has no team' do
        expect(user.team_name).to eq('None')
      end
    end
  end

  describe 'assotiations' do
    let(:user) { create(:user, team: team) }
    let(:team) { create(:team) }
    it 'belongs to team' do
      expect(user).to respond_to(:team)
    end
  end

end
