class AddMatchAmountToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :match_amount, :integer
  end
end
