class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum position: { intern: 0, junior: 1, senior: 2, pm: 3, ceo: 4, cto: 5, bo: 6 }
end
