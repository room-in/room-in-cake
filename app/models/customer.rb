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
  validates :postal_code, length: { minimum: 7, maximum: 7 }
  validates :address, length: { minimum: 5, maximum: 50 }
  validates :telephone_number, length: { minimum: 11, maximum: 12 }  

end
