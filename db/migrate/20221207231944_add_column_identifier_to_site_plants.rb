class AddColumnIdentifierToSitePlants < ActiveRecord::Migration[7.0]
  def change
    add_column :site_plants, :identifier, :integer
  end
end
