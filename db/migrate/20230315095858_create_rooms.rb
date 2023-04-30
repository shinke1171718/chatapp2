class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :current_user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
