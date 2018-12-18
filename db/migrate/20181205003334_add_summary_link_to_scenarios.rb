class AddSummaryLinkToScenarios < ActiveRecord::Migration[5.2]
  def change
    add_column :scenarios, :summary_link, :string
  end
end
