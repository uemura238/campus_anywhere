class AddstatusMessageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :status_message, :string
  end
end
