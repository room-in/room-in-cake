class AddNmaeToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :fast_name, :string
    add_column :customers, :second_name, :string
    add_column :customers, :kana_fast_name, :string
    add_column :customers, :kana_second_name, :string
    add_column :customers, :is_deleted, :boolean
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :telephone_number, :string
  end
end
