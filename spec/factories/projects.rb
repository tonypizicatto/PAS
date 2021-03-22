FactoryBot.define do
  factory :project, class: 'Project' do
    name { Forgery('name').company_name }
    summary  { Forgery('name').location }
    start_date { "06.01.2021" }
    end_date { "07.01.2021" }
    user { create(:user) }
  end

  factory :random_project, class: 'Project' do
    name { Forgery('internet').ip_v6 }
    summary  { Forgery('name').location }
    start_date { "06.01.2021" }
    end_date { "07.01.2021" }
    user_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
  end
end