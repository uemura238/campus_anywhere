class RemoveNameFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :name, :string
  end
end
