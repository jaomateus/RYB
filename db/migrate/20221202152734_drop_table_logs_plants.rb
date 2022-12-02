class DropTableLogsPlants < ActiveRecord::Migration[7.0]
  def change
    remove_reference :site_plants, :plants_log, index: true, foreign_key: true
    drop_table :plants_logs
  end
end
