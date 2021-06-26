class RemovePaySelectionFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :pay_selection, :integer
  end
end
