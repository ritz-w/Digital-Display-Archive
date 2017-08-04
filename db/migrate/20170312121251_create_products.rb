class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :string
      t.string :description
      t.string :text
      t.string :image_url

      t.timestamps
    end
  end
end
