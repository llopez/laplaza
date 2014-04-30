class ArticlesController < ApplicationController
  respond_to :html
  
  def index
    @q = Article.search(params[:q])
    @articles = @q.result.page(params[:page]).per(10)
    respond_with @articles
  end
end
