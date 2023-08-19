class User < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :project, through: :user_projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
