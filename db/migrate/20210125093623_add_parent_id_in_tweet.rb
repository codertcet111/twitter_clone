class AddParentIdInTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :parent_id, :integer
  end
end
