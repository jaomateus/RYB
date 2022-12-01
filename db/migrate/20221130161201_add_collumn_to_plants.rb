class AddCollumnToPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :name
    remove_column :plants, :site_id
    remove_column :plants, :latitude
    remove_column :plants, :longitude
    add_column :plants, :type, :string
    add_column :plants, :summary, :text
    add_column :plants, :width, :float
    add_column :plants, :height, :float
    add_column :plants, :family, :string
    add_column :plants, :usa_hardiness_low, :integer
    add_column :plants, :usa_hardiness_high, :integer
    add_column :plants, :habitats, :text
    add_column :plants, :range, :text
    add_column :plants, :weed_potential, :boolean
    add_column :plants, :physical_characteristics, :text
    add_column :plants, :edible_uses, :text
    add_column :plants, :medicinal_uses, :text
    add_column :plants, :cultivation_details, :text
    add_column :plants, :propagation_details, :text
  end
end
