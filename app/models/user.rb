class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :friend_requests, dependent: :destroy
  has_many :received_friend_requests, class_name: "FriendRequest", foreign_key: "requested_id", inverse_of: 'requested'
  has_many :requested_friend_requests, class_name: "FriendRequest", foreign_key: "requester_id", inverse_of: 'requester'
  # has_many :friends, -> {  where('status = ?  ', 'accepted') }, through: :requested, source: 'requested'

  has_many :posts
  has_many :likes, through: :posts

  def friends
    requested_friend_ids = requested_friend_requests.friends.pluck(:requested_id)
    received_friend_ids = received_friend_requests.friends.pluck(:requester_id)
    friend_ids = (requested_friend_ids + received_friend_ids).uniq
    User.where(id: friend_ids)
  end
end
