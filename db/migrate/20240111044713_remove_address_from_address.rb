class RemoveAddressFromAddress < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :address, :string
  end
end
