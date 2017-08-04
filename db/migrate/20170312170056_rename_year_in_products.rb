class RenameYearInProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :year, :year_made
  end
end