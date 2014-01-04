class ChangeBooksEv < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :books do |t|
        dir.up   { t.change :ev, :string }
        dir.down { t.change :ev, :decimal }
      end
    end    
  end
end
