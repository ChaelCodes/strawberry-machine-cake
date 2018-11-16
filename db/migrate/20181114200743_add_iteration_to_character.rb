class AddIterationToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :state, :string, index: true, default: 'active'
    add_column :characters, :version, :integer
    add_reference :characters, :previous_character, index: true
    add_foreign_key :characters, :characters, column: :previous_character_id
  end
end
