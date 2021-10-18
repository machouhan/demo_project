class Order < ApplicationRecord
  belongs_to :product, :foreign_key => "product_id"
  
  before_create :set_status

  def set_status
    self.status = "cart"
  end   
end