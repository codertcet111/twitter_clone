class AddActive < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :is_active, :boolean
  end
end
