class AddMakeStatusOderItems < ActiveRecord::Migration[5.2]
  def change
     add_column :order_items, :make_status, :integer
  end
end
