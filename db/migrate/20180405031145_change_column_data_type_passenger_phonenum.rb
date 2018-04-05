class ChangeColumnDataTypePassengerPhonenum < ActiveRecord::Migration[5.1]
  def change
    change_column :passengers, :phone_num, :string
  end
end
