class ArticlesController < ApplicationController
  respond_to :html
  
  def index
    @q = Article.search(params[:q])
    @articles = @q.result.page(params[:page]).per(10)
    respond_with @articles
  end
  
  def new
    @article = Article.new
    respond_with @article
  end
  
  def create
    @article = Article.new(article_params)
    flash[:notice] = "Article was successfully created." if @article.save
    respond_with(@article)
  end
  
  def show
    @article = Article.find params[:id]
    respond_with @article
  end
  
  def edit
    @article = Article.find params[:id]
    respond_with @article
  end
  
  def update
    @article = Article.find params[:id]
    flash[:notice] = "Article was successfully updated." if @article.update_attributes(article_params)
    respond_with(@article)
  end
  
  def destroy
    @article = Article.find params[:id]
    @article.destroy
    redirect_to articles_path
  end

private
  def article_params
    params.require(:article).permit(:title, :price, :stock)
  end
end
