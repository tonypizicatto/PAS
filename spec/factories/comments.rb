FactoryBot.define do
  factory :comment, class: 'Comment' do
    content { Forgery('lorem_ipsum').words(15) }
    user { create(:user) }

    trait :random_project do
      user_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
      commentable_type { "Project" }
      commentable_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
    end

    trait :random_task do
      user_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
      commentable_type { "Task" }
      commentable_id { Forgery(:basic).number(at_least: 1, at_most: 200) }
    end

    factory :project_comment do
      commentable_type { "Project" }
      commentable_id { create(:project).id }
    end

    factory :task_comment do
      commentable_type { "Task" }
      commentable_id { create(:task).id }
    end
  end
end