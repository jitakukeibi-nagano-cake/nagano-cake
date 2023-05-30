class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :item, through: :cart_item, dependent: :destroy
  has_many :cart_items
  has_many :delivery_addresses
  has_many :orders
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :phone_number, presence: true
   validates :email, presence: true

  def active_for_authentication?
    super && (self.is_deleted == false)
  end
end
