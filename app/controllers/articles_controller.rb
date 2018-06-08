class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "archie", password: "password", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
