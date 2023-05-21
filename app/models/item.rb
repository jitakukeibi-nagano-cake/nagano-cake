class Item < ApplicationRecord
  
  has_one_attached :image
  has_many :user, through: :cart_item
  has_many :cart_item
  #validates :name, presence: true
  #validates :price, presence: true
  #validates :introduction, presence: true, length: {maximum: 200 }
  
  def with_tax_price
    (price * 1.1).floor
  end 
  
end
