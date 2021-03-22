FactoryBot.define do
  factory :team, class: 'Team' do
    name { Forgery('basic').encrypt }
  end
end