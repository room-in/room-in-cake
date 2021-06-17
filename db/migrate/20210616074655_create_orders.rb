class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :total_price
      t.integer :pay_selection
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :order_status

      t.timestamps
    end
  end
end
