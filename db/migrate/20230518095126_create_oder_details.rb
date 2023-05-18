class CreateOderDitails < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_ditails do |t|

      t.integer :oder_id, null: false
      t.integer :item_, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
