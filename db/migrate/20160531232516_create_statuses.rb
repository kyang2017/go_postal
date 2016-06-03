class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :friend_id
      t.string :sentskip

      t.timestamps

    end
  end
end
