require "test_helper"

class PostTest < ActiveSupport::TestCase
  test 'user posts associations' do
    assert User.first.posts
  end

  test 'must have user reference and body' do
    string = 'My string'
    post1 = Post.new
    post2 = User.first.posts.new(body: string)
    post3 = Post.new(body: string)
    post4 = User.first.posts.new

    assert_not post1.save
    assert post2.save
    assert_not post3.save
    assert_not post4.save
    assert User.first.posts
  end
end
