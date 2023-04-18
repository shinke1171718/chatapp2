class CreateConversationRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_rooms do |t|
      t.references :userroom, null: false, foreign_key: true
      t.references :usermessage, null: false, foreign_key: true

      t.timestamps
    end
  end
end
