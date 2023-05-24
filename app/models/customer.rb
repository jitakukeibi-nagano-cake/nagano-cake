class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item, through: :cart_item, dependent: :destroy
  has_many :cart_items
  has_many :delivery_addresses
  has_many :orders
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
