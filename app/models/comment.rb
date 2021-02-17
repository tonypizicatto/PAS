class Comment < ApplicationRecord

  belongs_to :user, polymorphic: true

end
