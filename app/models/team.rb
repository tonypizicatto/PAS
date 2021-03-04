class Team < ApplicationRecord
  include CanCan::Ability
  has_many :projects
  has_many :users

  validates :name, length: { minimum: 3, maximum: 50 }, uniqueness: true
end
