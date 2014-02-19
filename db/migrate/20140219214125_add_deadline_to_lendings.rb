class AddDeadlineToLendings < ActiveRecord::Migration
  def change
    add_column :lendings, :deadline, :date
  end
end
