class AddStateToBooks < ActiveRecord::Migration
  def change
    add_column :books, :allapot, :string
  end
end
