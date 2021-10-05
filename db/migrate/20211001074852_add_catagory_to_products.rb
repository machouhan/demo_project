class AddCatagoryToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :catagory, :string
  end
end
