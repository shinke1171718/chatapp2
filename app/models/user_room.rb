class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
class User_room < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
