class ChangeCimLimitOnBooks < ActiveRecord::Migration
  def change
  	change_column :books, :cim, :string, limit: 500
  end
end
