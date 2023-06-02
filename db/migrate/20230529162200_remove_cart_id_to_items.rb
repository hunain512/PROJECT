class RemoveCartIdToItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :cart_id, :integer 
  end
end
