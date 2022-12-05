class ChangColumnOnLogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :logs, :site_plants_id, :site_plant_id
    change_column_null :logs, :site_plant_id, true
  end
end
