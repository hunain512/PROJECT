class AddStoreIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :store_id, :integer
  end
end
