class ChangeYearInProducts < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :products, :year_made, :year_made_string
    add_column :products, :year_made, :date

    Product.reset_column_information
    Product.find_each { |c| c.update_attribute(:year_made, c.year_made_string) } 
    remove_column :products, :year_made_string
  end
end