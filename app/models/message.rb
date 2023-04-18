class Message < ApplicationRecord
  validates :content, presence: true
  has_many :usermessage
end
