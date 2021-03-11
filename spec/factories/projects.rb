FactoryBot.define do
  factory :project, class: 'Project' do
    name { Forgery('name').location }
    summary  { Forgery('name').location }
    start_date { "06.01.2021" }
    end_date { "07.01.2021" }
    user_id { Forgery(:basic).number(:at_least => 1, :at_most => 300) }
  end
end