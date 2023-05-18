class AddlastNameTocustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string, null: false, default: ""
    add_column :customers, :first_name, :string, null: false, default: ""
    add_column :customers, :last_name_kana, :string, null: false, default: ""
    add_column :customers, :first_name_kana, :string, null: false, default: ""
    add_column :customers, :address, :string, null: false, default: ""
    add_column :customers, :postcode, :string, null: false, default: ""
    add_column :customers, :phone_number, :string, null: false, default: ""
    
    add_column :customers, :is_deleted, :boolean, default: false, null: false
  end
end
