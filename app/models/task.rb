class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :image, :dependent => :true
  has_many :comments, as: :commentable

  paginates_per 2
end
