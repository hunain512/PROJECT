class AddStoreIdToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :store_id, :int
  end
end