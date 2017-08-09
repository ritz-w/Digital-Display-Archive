class RemoveYearMadeFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :year_made, :string
  end
end
