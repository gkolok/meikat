class AddColumnsToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :raktar, :string
  	add_column :books, :targyszavak, :string, limit: 1024
  	add_column :books, :megjegyzesek, :string
  end
end
