class OrderDetail < ApplicationRecord
  # 製作ステータス（0: 着手不可, 1:製作待ち, 2: 製作中, 3: 製作完了）
  belongs_to :order
enum making_status: { 
  production_not_possible: 0,
  production_pending: 1,
  in_production: 2,
  production_complete: 3 
  
}

end
