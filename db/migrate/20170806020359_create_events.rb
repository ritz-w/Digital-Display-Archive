class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :host
      t.string :location    
      t.date :date_began
      t.date :date_ended
      t.string :description
      t.string :image_url
      t.boolean :recurring
      t.timestamps
    end
  end
end
