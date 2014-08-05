require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "strip title" do
    article = Article.new(title: " Accesorio pvc curva a 90 ")
    article.save
    assert_equal "Accesorio pvc curva a 90", article.title
  end

  test "remove whitespaces on title" do
    article = Article.new(title: "Accesorio    pvc   curva   a 90")
    article.save
    assert_equal "Accesorio pvc curva a 90", article.title
  end

end
