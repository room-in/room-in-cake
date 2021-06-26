class AddPaySelectionToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pay_selection, :boolean, default: false, null: false
  end
end
