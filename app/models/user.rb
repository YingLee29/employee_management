class User < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :project, through: :user_projects

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum position: { intern: 0, junior: 1, senior: 2, pm: 3, ceo: 4, cto: 5, bo: 6 }

  validates :name, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 20 }, numericality: { only_integer: true}
  validate :valid_birth_date
  validates :birth, presence: true
  validates :password, presence: true, on: :create
  validates :information, presence: true, length: { maximum: 300 }

  private

  def valid_birth_date
    if birth.present?
      if birth > Date.today
        errors.add(:birth, "Cannot be in the future")
      elsif birth < 60.years.ago
        errors.add(:birth, "Cannot be more than 60 years ago")
      end
    end
  end
end
