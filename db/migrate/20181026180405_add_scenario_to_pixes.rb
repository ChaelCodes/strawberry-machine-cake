class AddScenarioToPixes < ActiveRecord::Migration[5.2]
  def change
    add_reference :pixes, :scenario, foreign_key: true
  end
end
