class AddIndexToProjectsProjectName < ActiveRecord::Migration
  def change
  	add_index :projects, :project_name, unique: true
  end
end
