class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :site

      t.timestamps
    end
  end
end
