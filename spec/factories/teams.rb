FactoryBot.define do
  factory :team, class: 'Team' do
    name { Forgery('name').company_name + rand(1..1000).to_s }
  end
end