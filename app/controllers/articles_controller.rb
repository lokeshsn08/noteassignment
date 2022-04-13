class ArticlesController < ApplicationController
  before_action :get_user_detail, only: [:new,:create,:index]

  def index
    @articles = Article.where(user_id: session[:user_id])
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.where(user_id:session[:user_id])
    redirect_to new_article_path
  end

  def create
    @article = Article.create(
      user_id:session[:user_id],
      title:params["article"]["title"],
      body:params["article"]["body"]
    )
    if @article.valid?
      flash[:info] = "Article Added"
      redirect_to @article
    else
      flash[:error] = "Error- please try to create an account again."
      redirect_to new_user_path
    end
  end

  def update
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to users_dashboard_path
  end

  private
  def get_user_detail
    @current_user = User.find_by_id(session[:user_id])
  end
end
