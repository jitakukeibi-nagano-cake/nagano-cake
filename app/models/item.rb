class Item < ApplicationRecord
    has_one_attached :image
    
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre
    
    validates :name, presence: true
    validates :introduction, presence: true, length: { minimum: 0, maximum: 500 }
    validates :price, presence: true

    
end
