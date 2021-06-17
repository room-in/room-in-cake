class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :fast_name, length: { minimum: 2, maximum: 20 }
  validates :second_name, length: { minimum: 2, maximum: 20 }
  validates :kana_fast_name, length: { minimum: 2, maximum: 20 }
  validates :kana_second_name, length: { minimum: 2, maximum: 20 }
  validates :second_name, length: { minimum: 2, maximum: 20 }
  validates :second_name, length: { minimum: 2, maximum: 20 }
  
  validates :introduction, length: { maximum: 50 }
end
