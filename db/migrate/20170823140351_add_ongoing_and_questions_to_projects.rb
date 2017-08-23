class AddOngoingAndQuestionsToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :questions, :text
    add_column :projects, :ongoing, :boolean
  end
end
