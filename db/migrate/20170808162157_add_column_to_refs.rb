class AddColumnToRefs < ActiveRecord::Migration[5.0]
  def change
    add_column :refs, :location, :string
    add_column :refs, :title, :string
  end
end
