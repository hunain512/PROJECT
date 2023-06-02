class CreateUserStores < ActiveRecord::Migration[6.1]
  def change
    create_table :user_stores do |t|
      t.integer :store_id
      t.integer :user_id

      t.timestamps
    end
  end
end
