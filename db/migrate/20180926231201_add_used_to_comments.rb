class AddUsedToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :used, :integer, default: 1
  end
end
