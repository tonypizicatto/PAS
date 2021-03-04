class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  paginates_per 1
  include CanCan::Ability
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  before_save { self.email = email.downcase }
  validates :first_name, :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 5, maximum: 250 }, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_many :projects
  has_many :tasks, through: :projects
  has_many :comments, dependent: :destroy
  belongs_to :team, optional: true

  def name
    first_name + ' ' + last_name
  end

  def team_name
    if team == nil
      'None'
    else
      team.name
    end
  end

end
