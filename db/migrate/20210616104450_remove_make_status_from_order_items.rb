class RemoveMakeStatusFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :make_status, :boolean
  end
end
