class Item < ApplicationRecord
  attachment :image
  belongs_to :item_genre
  validates :name, presence: true, uniqueness: true
  validates :text, presence: true
  validates :genre, presence: true
  validates :sub_price, presence: true
  validates :status, inclusion: { in: [true, false] }
end
