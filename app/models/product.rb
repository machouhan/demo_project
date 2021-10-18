class Product < ApplicationRecord
  has_one_attached :image
  
  has_and_belongs_to_many :orders, :join_table => "orders"
end