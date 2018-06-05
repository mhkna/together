class RemoveNewFromRounds < ActiveRecord::Migration[5.2]
  def change
    remove_column :rounds, :new
  end
end
