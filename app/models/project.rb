class Project < ApplicationRecord
  has_many :teams
  has_many :tasks #, :dependent => :true
  has_many :users, :through => :tasks
  # Project has many comments(polymorphic)
end
