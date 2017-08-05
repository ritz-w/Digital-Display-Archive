class Add < ActiveRecord::Migration[5.0]
  def change
    rename_column :projects, :tagline, :website
    add_column :projects, :analysis, :text
    add_column :projects, :date_ended, :date
  end
end
