class User < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :project, through: :user_projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum position: { intern: 0, junior: 1, senior: 2, pm: 3, ceo: 4, cto: 5, bo: 6 }

  validates :name, presence: true
end
