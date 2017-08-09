class AddDateBeganToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :date_began, :date
  end
end