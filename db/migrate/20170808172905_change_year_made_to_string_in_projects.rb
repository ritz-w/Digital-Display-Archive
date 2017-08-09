class ChangeYearMadeToStringInProjects < ActiveRecord::Migration[5.0]
  change_table :projects do |t|
    t.change :year_made, 'date USING CAST(year_made AS date)'
  end
end

