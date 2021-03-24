FactoryBot.define do
  factory :task, class: 'Task' do
    title { Forgery('name').company_name }
    content  { Forgery('name').location }
    status { Forgery(:basic).number(at_least: 0, at_most: 2) }
    start_date { "06.01.2021" }
    due_date { "07.01.2021" }
    estimation { Forgery(:basic).number(at_least: 1, at_most: 10) }
    project { create(:project) }
    users { [create(:user)] }

    trait :random_user_project do
      user_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
      project_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
    end
  end

  factory :task_without_user, class: 'Task' do
    title { Forgery('name').company_name }
    content  { Forgery('name').industry }
    status { :open }
    start_date { "06.01.2021" }
    due_date { "07.01.2021" }
    estimation { Forgery(:basic).number(at_least: 1, at_most: 10) }

    trait :random_user_project do
      title { Forgery('name').company_name + rand(1..1000).to_s }
      content  { Forgery('name').industry + rand(1..1000).to_s }
      status { Forgery(:basic).number(at_least: 0, at_most: 2) }
      start_date { "06.01.2021" }
      due_date { "07.01.2021" }
      estimation { Forgery(:basic).number(at_least: 1, at_most: 10) }
    end
  end
end