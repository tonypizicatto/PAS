FactoryBot.define do
  factory :comment, class: 'Comment' do
    content { Forgery('lorem_ipsum').words(15) }
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