class Order < ApplicationRecord
	belongs_to :product, :foreign_key => "product_id"

	#belongs_to :product, :foreign_key => "user_id"
end
