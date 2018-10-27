class AddStyleToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :color, :string
    add_column :characters, :handle, :string
  end
end
