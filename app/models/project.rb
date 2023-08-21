class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  enum project_type: { lab: 0, single: 1, acceptance: 2 }
  enum status: { planned: 0, onhold: 1, doing: 2, done: 3, cancelled: 4 }

  validates :name, presence: true, length: { maximum: 10 }
  validates :information, presence: true, length: { maximum: 300 }
  validates :deadline, presence: true
  validate :valid_deadline_date

  def self.create_with_user_roles(params)
    project = Project.new(params[:project_params])

    if project.save
      params[:user_roles].each do |user_id, role|
        project.user_projects.create(user_id: user_id, role: role)
      end
    end
    project
  end

  def update_with_user_roles(params)
    self.attributes = params[:project_params]

    if save
      user_projects.destroy_all
      params[:user_roles].each do |user_id, role|
        user_projects.create(user_id: user_id, role: role)
      end
    end
    persisted?
  end

  private

  def valid_deadline_date
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "deadline cannot be in the future")
    end
  end
end
