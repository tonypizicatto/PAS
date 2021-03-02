class Team < ApplicationRecord
  has_many :projects
  has_many :users

  validates :name, length: { minimum: 3, maximum: 50 }, uniqueness: true
end
