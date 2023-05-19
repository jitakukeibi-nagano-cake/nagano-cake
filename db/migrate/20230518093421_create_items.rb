class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.boolean :is_active, default: true, null: false
      t.integer :genre_id, null: false
      t.string :image_id
       
      
      t.timestamps
    end
  end
end
