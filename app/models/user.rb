class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  enum position: { intern: 0, junior: 1, senior: 2, pm: 3, ceo: 4, cto: 5, bo: 6 }

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :user_projects, dependent: :destroy
  has_many :project, through: :user_projects


  validates :name,  length: { maximum: 50 }, presence: :true
  validates :information,  length: { maximum: 300 }
  validates :phone,  length: { is: 10 }
  validates :email, format: { with: VALID_EMAIL_REGEX}, presence: :true

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end
