class OrderItem < ApplicationRecord

   belongs_to :order
  enum make_status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }
  
  validates :quantity, presence: true
  validates :price, presence: true
  validates :total_price, presence: true
end
