class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image
  belongs_to :genre
  has_many :order_items, dependent: :destroy
  validates :name, presence: true
  validates :text, presence: true
  validates :sub_price, presence: true
  validates :status, inclusion: { in: [true, false] }
end
