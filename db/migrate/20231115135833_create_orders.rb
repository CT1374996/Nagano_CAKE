class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :receiver_name, null: false
      t.string :receiver_postal_code, null: false
      t.string :receiver_address, null: false
      t.integer :shipping_fee, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :monetary_amount, null: false

      t.timestamps
    end
  end
end
