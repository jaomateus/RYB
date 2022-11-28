class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :project_name
      t.text :description
      t.string :address
      t.string :project_type
      t.float :project_area
      t.float :latitude
      t.float :longitude
      t.references :user

      t.timestamps
    end
  end
end
