class CartItem < ApplicationRecord
  has_many :items, dependent: :destroy

  def subtotal
    item.with_tax_price * amount
  end
end
