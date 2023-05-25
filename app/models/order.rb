class Order < ApplicationRecord
has_many :order_details, dependent: :destroy
belongs_to :customer
has_many :items, through: :order_details
  # 注文ステータス（0: 入金待ち, 1:入金確認, 2: 製作中, 3: 発送準備中, 4: 発送済み）
enum status: {
    waiting: 0,
    paid_up: 1,
    in_production: 2,
    preparing: 3,
    shipped: 4
}

enum payment_method: { クレジットカード: 0, 銀行振込: 1}

end
