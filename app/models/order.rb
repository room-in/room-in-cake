class Order < ApplicationRecord
  
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4}
def full_delivery
        " 〒 #{ self.postal_code } #{ self.address } #{ self.name } "
end

end
