class Item < ApplicationRecord
  belongs_to :cart_item
  attachment :image
  belongs_to :genre
  validates :name, presence: true
  validates :text, presence: true
  validates :sub_price, presence: true
  validates :status, inclusion: { in: [true, false] }
end
