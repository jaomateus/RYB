class AddPlantTagColumnToSitePlant < ActiveRecord::Migration[7.0]
  def change
    add_column :site_plants, :plant_tag, :string
  end
end
