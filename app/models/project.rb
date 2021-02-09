class Project < ApplicationRecord
  has_many :teams
  has_many :tasks
  has_many :users, :through => :tasks
  # Project has many comments(polymorphic)
end
