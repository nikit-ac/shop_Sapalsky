class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status
      t.string :delivery_info
      t.string :email
      t.string :phone
      t.string :name
      t.integer :product_id, index: true

      t.timestamps
    end
  end
end
