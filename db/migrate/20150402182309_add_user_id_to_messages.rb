class AddUserIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :number_id, :integer
  end
end
