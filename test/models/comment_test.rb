require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test 'associations' do
    c1 = Comment.new
    c2 = Post.first.comments.new
    c3 = Post.second.comments.new(user: User.first)
    c5 = User.second.comments.new(post: Post.first, body: 'One comment')
    c4 = Post.second.comments.new(user: User.first, body: 'One comment')

    assert_not c1.valid?
    assert_not c2.valid?
    assert_not c3.valid?
    assert c4.valid?
    assert_not c5.valid?
  end
end
