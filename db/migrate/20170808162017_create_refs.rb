class CreateRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :refs do |t|
      t.string :first_name
      t.string :last_name
      t.date :year_published
      t.string :publisher
      t.string :format
      t.string :pdf_url

      t.timestamps
    end
  end
end
