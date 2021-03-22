# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'
300.times do
  FactoryBot.create :team
end
300.times do
  FactoryBot.create :user, :random_team
end
300.times do
  FactoryBot.create :random_project
end
300.times do
  FactoryBot.create :task_without_user, :random_user_project
end
300.times do
  FactoryBot.create :comment, :random_task
end
300.times do
  FactoryBot.create :comment, :random_project
end
1.times do
  FactoryBot.create :user, :random_team_admin
end