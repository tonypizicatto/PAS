class Project < ApplicationRecord
  paginates_per 3
  include CanCan::Ability
  has_many :teams
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks
  has_many :comments, as: :commentable

  validates :start_date, :end_date, presence: true
  validates :name, length: { minimum: 3, maximum: 100 }, uniqueness: true

end
