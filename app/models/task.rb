class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_many :comments, as: :commentable

  validates :title, length: { minimum: 3, maximum: 100 }
  validates :content, length: { minimum: 3, maximum: 250 }

  paginates_per 2
end
