class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :name, presence: true

  def subtotal
    item.with_tax_price * quantity
  end

end
