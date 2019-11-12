class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    find_article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new_article
    end
  end

  def edit
    find_article
  end

  def update
    find_article
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit_article
    end
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
