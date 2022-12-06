class ChangeSitePlantsPlantedDefaultoToTrue < ActiveRecord::Migration[7.0]
  def change
    change_column :site_plants, :planted, :boolean, default: :true
  end
end
