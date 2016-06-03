class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :note
      t.integer :friend_id

      t.timestamps

    end
  end
end
