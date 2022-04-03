class CreateMicroposts < ActiveRecord::Migration[6.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.string :univ
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
