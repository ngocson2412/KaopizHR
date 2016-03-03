class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.float :plan_time, default: 0
      t.float :real_time, default: 0

      t.timestamps null: false
    end
  end
end
