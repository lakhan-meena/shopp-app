class AddUserIdToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :user_id, :integer, index: true
  end
end
