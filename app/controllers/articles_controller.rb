class ArticlesController < ApplicationController
  respond_to :html, :json
  
  def index
    search = Article.search do
      fulltext params[:q]
      paginate page: params[:page], per_page: 15
    end

    @articles = search.results

    respond_with @articles
  end
  
  def new
    @article = Article.new
    respond_with @article
  end
  
  def create
    @article = Article.new(article_params)
    flash[:notice] = I18n.t("flash.article.create") if @article.save
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
    flash[:notice] = I18n.t("flash.article.update") if @article.update_attributes(article_params)
    respond_with(@article)
  end
  
  def destroy
    @article = Article.find params[:id]
    respond_to do |format|
      if @article.destroy
        format.json{ render json: @article }
        format.html{
          flash[:notice] = I18n.t("flash.article.destroy.success")
          redirect_to articles_path
        }
      else
        format.json{ render json: @article}
        format.html{
          flash[:error] = I18n.t("flash.article.destroy.error")
          redirect_to articles_path
        }
      end
    end
  end

private
  def article_params
    params.require(:article).permit(:title, :price, :stock)
  end
end
