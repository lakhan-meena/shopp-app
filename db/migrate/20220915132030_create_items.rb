class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.references :product
      t.references :cart
      t.references :order
      t.decimal :subtotal, precision: 18, scale: 4, default: 0.0
      t.timestamps
    end
  end
end
