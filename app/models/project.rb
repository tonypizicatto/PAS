class Project < ApplicationRecord
  has_many :teams
  has_many :tasks #, :dependent => :true
  has_many :users, :through => :tasks
  has_many :comments, as: :user
  # Project has many comments(polymorphic)
end
