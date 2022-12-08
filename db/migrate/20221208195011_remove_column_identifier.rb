class RemoveColumnIdentifier < ActiveRecord::Migration[7.0]
  def change
    remove_column :site_plants, :identifier, :string
  end
end
