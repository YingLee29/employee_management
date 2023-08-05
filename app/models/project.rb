class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  enum project_type: { lab: 0, single: 1, acceptance: 2 }
  enum status: { planned: 0, onhold: 1, doing: 2, done: 3, cancelled: 4 }
end
