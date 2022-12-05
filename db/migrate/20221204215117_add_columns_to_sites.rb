class AddColumnsToSites < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :atmospheric_polution, :string
    add_column :sites, :maritime_exposure, :boolean
    add_column :sites, :soil_type, :string
    add_column :sites, :soil_ph, :string
    add_column :sites, :usa_hardiness_zone, :integer
  end
end
