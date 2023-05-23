class Item < ApplicationRecord

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :customer, through: :cart_item
  has_many :cart_item
  
  validates :name, presence: true
  validates :price, presence: true
  validates :introduction, presence: true, length: {maximum: 200 }

  def with_tax_price
    (price * 1.1).floor
  end

end
