class Project < ApplicationRecord
  has_many :teams
  has_many :tasks #(использовать nested resources)
  # Project has many comments(polymorphic)
end
