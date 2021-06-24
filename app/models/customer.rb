class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# 登録時のバリデーション、文字数、空白、入力文字の制限
  validates :fast_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :second_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :kana_fast_name, presence: true, length: { minimum: 2, maximum: 20 },
  format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "フリガナは、全角カタカナのみで入力して下さい"}
  validates :kana_second_name,presence: true, length: { minimum: 2, maximum: 20 },
  format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "フリガナはシュウセイ全角カタカナのみで入力して下さい"}
  validates :postal_code,presence: true , length: { minimum: 7, maximum: 7 }
  validates :address, presence: true, length: { minimum: 5, maximum: 50 }
  validates :telephone_number, presence: true, length: { minimum: 10, maximum: 12 }
  validates :email, presence: true

#アソシエーション
  has_many :adresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  # 退会機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end


end
