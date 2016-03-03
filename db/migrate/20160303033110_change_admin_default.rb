class ChangeAdminDefault < ActiveRecord::Migration
  def change
  	change_column_default :users,:admin,default: false
  end
end
