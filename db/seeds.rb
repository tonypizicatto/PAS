# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

100.times do
  FactoryBot.create(:team)
end

team_ids = Team.pluck(:id)

100.times do
  FactoryBot.create(:user, team_id: team_ids.sample)
end

user_ids = User.pluck(:id)

100.times do
  FactoryBot.create(:random_project, user_id: user_ids.sample)
end

project_ids = Project.pluck(:id)

100.times do
    FactoryBot.create(:task_without_user, user_id: user_ids.sample, project_id: project_ids.sample)
end

task_ids = Task.pluck(:id)

100.times do
    FactoryBot.create(:comment, user_id: user_ids.sample, commentable_type: "Project", commentable_id: project_ids.sample)
end

100.times do
    FactoryBot.create(:comment, user_id: user_ids.sample, commentable_type: "Task", commentable_id: task_ids.sample)
end

1.times do
    FactoryBot.create(:user, :production_admin, team_id: team_ids.sample)
end










# 200.times do
#   FactoryBot.create :team
# end
# 200.times do
#   FactoryBot.create :user, :random_team
# end
# 200.times do
#   FactoryBot.create :random_project
# end
# 200.times do
#   FactoryBot.create :task_without_user, :random_user_project
# end
# 200.times do
#   FactoryBot.create :comment, :random_task
# end
# 200.times do
#   FactoryBot.create :comment, :random_project
# end
# 1.times do
#   FactoryBot.create :user, :random_team_admin
# end