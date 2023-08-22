class ChangeDescriptionTypeInProjects < ActiveRecord::Migration[7.0]
  def change
    change_column :projects, :description, :text
  end
end
