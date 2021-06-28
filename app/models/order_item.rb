class OrderItem < ApplicationRecord

  has_many :order_items

  # has_many :order
  belongs_to :order
  belongs_to :item


  enum make_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }
  # enum make_status: { fuka: 0, mati: 1, cyuu: 2, kannryou: 3 } 

  validates :quantity, presence: true
  validates :main_price, presence: true
end
