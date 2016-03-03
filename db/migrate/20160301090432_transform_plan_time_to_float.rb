class TransformPlanTimeToFloat < ActiveRecord::Migration
  def change
  	change_column :projects, :plan_time, :float, :default => 0
  end
end
