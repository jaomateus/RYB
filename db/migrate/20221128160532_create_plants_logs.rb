class CreatePlantsLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :plants_logs do |t|
      t.references :log, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
