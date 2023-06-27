require "test_helper"

class FriendRequestTest < ActiveSupport::TestCase
  test 'Creates FriendRequest' do
    assert_difference -> { FriendRequest.count } do
      FriendRequest.create(requester: User.first, requested: User.second)
    end

    f = FriendRequest.create(requester: User.first, requested: User.second)
    assert_equal('pending', f.status)
  end

  test 'change in FriendRequest count' do
    assert_difference -> { FriendRequest.count } do
      FriendRequest.create(requester: User.first, requested: User.second)
    end

    assert_no_difference -> { FriendRequest.friends.count } do
      FriendRequest.create(requester: User.first, requested: User.second)
    end
  end
end
