class AccountHandleRename < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :handle, :username
  end
end
