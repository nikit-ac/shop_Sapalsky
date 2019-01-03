class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :product_id, index: true

      t.timestamps
    end
  end
end
