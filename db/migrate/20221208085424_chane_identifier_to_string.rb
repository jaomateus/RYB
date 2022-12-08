class ChaneIdentifierToString < ActiveRecord::Migration[7.0]
  def change
    change_column :site_plants, :identifier, :string
  end
end
