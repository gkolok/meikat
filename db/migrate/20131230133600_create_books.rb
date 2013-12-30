class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :szerzo
      t.string :cim
      t.string :jelzet
      t.string :kiado
      t.decimal :ev
      t.string :kulso_leiras

      t.timestamps
    end
  end
end
