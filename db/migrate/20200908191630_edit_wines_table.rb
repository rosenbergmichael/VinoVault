class EditWinesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :wines 
  end
end
