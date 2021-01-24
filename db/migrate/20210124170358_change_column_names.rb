class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :tweets, :user_id, :author_id
    rename_column :follows, :followed_user_id, :followed_id
  end
end
