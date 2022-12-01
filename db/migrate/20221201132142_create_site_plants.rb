class CreateSitePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :site_plants do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :plants_log, null: false, foreign_key: true
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
