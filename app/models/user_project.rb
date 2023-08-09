class UserProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum role: { dev: 0, pl: 1, pm: 2, po: 3, sm: 4 }
end
