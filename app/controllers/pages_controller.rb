class PagesController < ApplicationController
  before_action :require_banned
  # include HTTParty

  def index
    @user = current_user
    @articles = Article.order(created_at: :desc).limit(2)
    @articles_side = if current_user
                       @user.articles.limit(2)
                     else
                       Article.limit(2)
                     end

    params[:category] = 'google-news' if params[:category].nil?
    @news = Hashie::Mash.new(HTTParty.get("https://newsapi.org/v1/articles?source=#{params[:category]}&apiKey=4019ed950c264a15ac44ac4bb4bde7dd"))
  end

  def show
    @new = New.find(params[:id])
  end

  def profile
    render 'devise/profile' if current_user.email
  end
end
