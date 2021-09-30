class ChangePriceToBeDecimalInProducts < ActiveRecord::Migration[6.1]
  def change
    def change
    change_column :products, :price, :decimal
    end
  end
end
