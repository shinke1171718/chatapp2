class ConversationRoom < ApplicationRecord
  belongs_to :userroom
  belongs_to :user_message
end
