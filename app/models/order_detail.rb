class OrderDetail < ApplicationRecord
  # 製作ステータス（0: 着手不可, 1:製作待ち, 2: 製作中, 3: 製作完了）
  belongs_to :order
enum making_status: { 
  production_not_possible: 0,
  production_pending: 1,
  in_production: 2,
  production_complete: 3 
  
}

  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :payment_method, presence: true
  validates :total_payment, presence: true
  validates :status, presence: true
  validates :email, presence: true
   
end
