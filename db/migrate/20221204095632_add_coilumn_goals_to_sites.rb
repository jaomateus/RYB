class AddCoilumnGoalsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :project_start_date, :date
    add_column :sites, :goals, :string
  end
end
