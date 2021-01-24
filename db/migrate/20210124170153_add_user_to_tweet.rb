class AddUserToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :user_id, :integer
    add_index :tweets, :user_id
  end
end
