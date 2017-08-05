class RenameProductstoProjects < ActiveRecord::Migration[5.0]
  def change
    rename_table :products, :projects
    rename_column :projects, :artist, :author
    rename_column :projects, :name, :title
    rename_column :projects, :text, :tagline
  end
end
