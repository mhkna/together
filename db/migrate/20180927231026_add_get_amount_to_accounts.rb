class AddGetAmountToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :get_amount, :integer
  end
end
