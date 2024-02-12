class CreatePersonels < ActiveRecord::Migration[7.1]
  def change
    create_table :personels do |t|
      t.string :name
      t.string :surname
      t.string :department
      t.boolean :status
      t.date :entry
      t.date :due
      t.date :birth
      t.string :nation

      t.timestamps # created_at, updated_at
    end
  end
end
