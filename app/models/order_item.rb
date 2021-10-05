class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_unit_price
  before_save :set_total


  def total
    (product.price)*(quantity)
  end

  private

  def set_unit_price
  	unit_price = persisted? ? unit_price : product.price
  end
  
  def set_total
    total = total*quantity
  end
end
