class RenameStringInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :string, :artist
  end
end
