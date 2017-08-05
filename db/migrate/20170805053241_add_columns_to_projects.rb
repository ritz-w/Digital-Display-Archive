class AddColumnsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :collaborators, :text
    add_column :projects, :img3_url, :string
    add_column :projects, :img4_url, :string
  end
end
