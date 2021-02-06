class Project < ApplicationRecord
  has_one :team
  has_many :tasks #(использовать nested resources)
  belongs_to :users
end
