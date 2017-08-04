class AddYear < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :year, :string
  end
end
