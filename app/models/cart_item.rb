class CartItem < ApplicationRecord
  has_many :customer, dependent: :destroy
  has_many :items, dependent: :destroy
end
