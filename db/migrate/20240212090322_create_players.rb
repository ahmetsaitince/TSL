class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.belongs_to :personel, foreign_key: true
      t.string :position
      t.integer :height
      t.string :foot
      t.integer :market_value
      t.integer :transfer_type
      t.string :previous_club
      t.references :personel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
