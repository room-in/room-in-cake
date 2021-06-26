class Adress < ApplicationRecord

    validates :postal_code, length: { minimum: 7, maximum: 7 }
    validates :delivery, length: { minimum: 5, maximum: 50 }
    validates :name, length: { minimum: 2, maximum: 20 }

    belongs_to :customer

    def full_delivery
         '〒' + self.postal_code + '　' + self.delivery + '　' + self.name
    end

end
