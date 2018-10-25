class CreatePixes < ActiveRecord::Migration[5.2]
  def change
    create_table :pixes do |t|
      t.text :msg
      t.references :character

      t.timestamps
    end
  end
end
