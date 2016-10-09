require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "yesh", email: "yesh@yesh.com", password: "password")
  end


  test "the article creation form and upon clicking it should go to that particular article" do
  #   assert true
    sign_in_as(@user, 'password')

    get new_article_path
    assert_template 'articles/new'

    # checks count after test article was made
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: { title: "SAMPLE ARTICLE",
        description: "this is the integration test for creating articles"}
      end
    # redirect and look for title of test article
    assert_template 'articles/show'
    assert_match 'SAMPLE ARTICLE', response.body
  end
end
