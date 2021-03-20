FactoryBot.define do
  factory :comment, class: 'Comment' do
    content { Forgery('lorem_ipsum').words(15) }
    user_id { Forgery(:basic).number(at_least: 1, at_most: 303) }
    # commentable_type { "Task" }
    # commentable_id { Forgery(:basic).number(at_least: 3, at_most: 303) }
    user { create(:user) }

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