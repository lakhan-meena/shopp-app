class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :title
      t.text :description
      t.string :image
      t.decimal :price, default: 0.0, precision: 18, scale: 4
      t.decimal :discount, default: 0.0, precision: 18, scale: 4
      t.boolean :active, default: false
      t.boolean :discountable, default: false
      t.boolean :popular, default: false
      t.integer :quantity, default: 0
      t.references :category, index: true
      t.timestamps
    end
  end
end
