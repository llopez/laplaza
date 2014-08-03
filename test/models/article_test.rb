require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "title sanitation" do
    article = Article.new(title: " Accesorio pvc curva  a 90 ")
    article.save
    assert_equal "Accesorio pvc curva a 90", article.title
  end

end
