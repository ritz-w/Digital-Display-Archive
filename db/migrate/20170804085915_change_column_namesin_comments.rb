class ChangeColumnNamesinComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :product_id, :project_id
  end
end
