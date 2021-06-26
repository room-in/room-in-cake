class Adress < ApplicationRecord
  
    validates :postal_code, presence: true, length: { minimum: 7, maximum: 7 }
    validates :delivery, presence: true, length: { minimum: 5, maximum: 50 }
    validates :name, presence: true, length: { minimum: 2, maximum: 20 }
    # アソシエーション
    belongs_to :customer
  
  　def full_delivery
         '〒' + self.postal_code + '　' + self.delivery + '　' + self.name
   end
  
end
