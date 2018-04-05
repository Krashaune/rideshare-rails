class AddCarMakeToDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :car_make, :text
  end
end
