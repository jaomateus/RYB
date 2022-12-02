class AddColumnToSitePlants < ActiveRecord::Migration[7.0]
  def change
    add_column :site_plants, :planted, :boolean, default: false
  end
end
