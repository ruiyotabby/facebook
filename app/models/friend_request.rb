class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'

  scope :friends, -> { where('status = ?', 'accepted') }
end
