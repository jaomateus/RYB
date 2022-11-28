class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :latin_name
      t.string :common_name
      t.text :description
      t.integer :hardiness
      t.boolean :planted
      t.integer :edibility_rate
      t.boolean :well_drained
      t.boolean :moist_soil
      t.boolean :wet_soil
      t.boolean :water_plant
      t.boolean :full_sun
      t.boolean :part_shade
      t.boolean :full_shade
      t.boolean :n_fixer
      t.boolean :maritime_exposure
      t.boolean :atmospheric_polution
      t.integer :medicinal_rating
      t.references :site

      t.timestamps
    end
  end
end
