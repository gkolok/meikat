class CreateLendings < ActiveRecord::Migration
  def change
    create_table :lendings do |t|
      t.text :lender
      t.references :book, index: true

      t.timestamps
    end
  end
end
