class Comment < ApplicationRecord
  include CanCan::Ability
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :content, presence: :true

  paginates_per 5
end
