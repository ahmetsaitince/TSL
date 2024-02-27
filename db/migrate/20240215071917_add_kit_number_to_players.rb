class AddKitNumberToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :kit_number, :integer
  end
end
