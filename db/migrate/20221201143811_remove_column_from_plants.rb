class RemoveColumnFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :planted, :boolean
  end
end
