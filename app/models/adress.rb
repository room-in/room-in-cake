class Adress < ApplicationRecord
    
    validates :postal_code, length: { minimum: 7, maximum: 7 }
    validates :delivery, length: { minimum: 5, maximum: 50 }
    validates :name, length: { minimum: 2, maximum: 20 }
    
    belongs_to :customer 
end
