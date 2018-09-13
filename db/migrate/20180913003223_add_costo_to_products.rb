class AddCostoToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :costo, :float
  end
end
