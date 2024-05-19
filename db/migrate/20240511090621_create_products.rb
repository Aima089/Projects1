class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :color
      t.integer :product_type

      t.timestamps
    end
  end
end
