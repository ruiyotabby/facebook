require "test_helper"

class LikeTest < ActiveSupport::TestCase
  test "association" do
    like1 = User.first.posts.first.likes.new
    like2 = User.first.likes.new
    like3 = Post.first.likes.new
    like4 = Post.first.likes.new(user: User.first)

    assert User.first.likes
    assert Post.first.likes
    assert_not like1.valid?
    assert_not like2.valid?
    assert_not like3.valid?
    assert like4.valid?
  end
end
