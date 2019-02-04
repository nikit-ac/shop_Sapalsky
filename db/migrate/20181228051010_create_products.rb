class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :status
      t.integer :category_id, index: true

      t.timestamps
    end
  end
end
