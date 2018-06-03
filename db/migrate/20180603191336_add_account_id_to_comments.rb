class AddAccountIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :account_id, :integer
  end
end
