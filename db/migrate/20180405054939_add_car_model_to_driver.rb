class AddCarModelToDriver < ActiveRecord::Migration[5.1]
  def change
        add_column :drivers, :car_model, :text
  end
end
