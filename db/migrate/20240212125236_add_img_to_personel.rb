class AddImgToPersonel < ActiveRecord::Migration[7.1]
  def change
    add_column :personels, :img, :string
  end
end
