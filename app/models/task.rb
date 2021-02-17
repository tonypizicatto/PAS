class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_one_attached :image, :dependent => :true
  has_many :comments, as: :user
  paginates_per 1
end
