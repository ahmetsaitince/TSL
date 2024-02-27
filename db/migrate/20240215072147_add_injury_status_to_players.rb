class AddInjuryStatusToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :injured, :boolean
  end
end
