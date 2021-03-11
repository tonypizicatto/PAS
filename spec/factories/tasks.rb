FactoryBot.define do
  factory :task, class: 'Task' do
    title { Forgery('name').location }
    content  { Forgery('name').location }
    status { Forgery(:basic).number(:at_least => 0, :at_most => 2) }
    start_date { "06.01.2021" }
    due_date { "07.01.2021" }
    estimation { Forgery(:basic).number(:at_least => 1, :at_most => 10) }
    project_id { Forgery(:basic).number(:at_least => 1, :at_most => 300) }
    user_id { Forgery(:basic).number(:at_least => 1, :at_most => 300) }
  end
end