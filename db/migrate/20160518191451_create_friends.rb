class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :address
      t.integer :year
      t.integer :day
      t.string :name
      t.integer :month

      t.timestamps

    end
  end
end
