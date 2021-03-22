FactoryBot.define do
  factory :team, class: 'Team' do
    name { Forgery('name').full_name }
  end
end