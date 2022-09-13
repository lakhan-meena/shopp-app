class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :title, null: false
      t.text :description
      t.string :image
      t.decimal :price, default: 0.0
      t.decimal :discount, default: 0.0
      t.references :category, index: true
      t.timestamps
    end
  end
end
