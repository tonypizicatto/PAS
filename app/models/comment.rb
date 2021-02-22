class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  paginates_per 5
end
