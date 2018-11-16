class CreateJoinTableForCharactersAndScenarios < ActiveRecord::Migration[5.2]
  def change
    create_join_table :characters, :scenarios do |t|
      t.index :character_id
      t.index :scenario_id
    end
  end
end
