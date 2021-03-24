FactoryBot.define do
  factory :project, class: 'Project' do
    name { Forgery('name').company_name }
    summary  { Forgery('name').location }
    start_date { "06.01.2021" }
    end_date { "07.01.2021" }
    users { [create(:user)] }
  end

  factory :random_project, class: 'Project' do
    name { Forgery('name').company_name + rand(1..1000).to_s }
    summary  { Forgery('name').industry + rand(1..1000).to_s }
    start_date { "06.01.2021" }
    end_date { "07.01.2021" }
  end
end