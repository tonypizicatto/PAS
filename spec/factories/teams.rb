FactoryBot.define do
  factory :team, class: 'Team' do
    name { Forgery('name').company_name }
  end
end