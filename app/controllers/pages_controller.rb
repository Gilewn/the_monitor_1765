class PagesController < ApplicationController
  before_action :require_banned
  # include HTTParty

  def index
    # @news = New.all
    # @user = current_user
    # @articles = Article.order(created_at: :desc).limit(2)
    # if current_user
    #   @articles_side = @user.articles.limit(2)
    # else
    #   @articles_side = Article.order(updated_at: :desc).limit(2)
    # end
    # byebug
    # params[:category] = 'techcrunch' unless params[:category].exists

    params[:category] = 'techcrunch' if params[:category].nil?
    @news = Hashie::Mash.new(HTTParty.get("https://newsapi.org/v1/articles?source=#{params[:category]}&apiKey=4019ed950c264a15ac44ac4bb4bde7dd"))
    # render json: @news
    # @news = Testart.all
  end

  def show
    @new = New.find(params[:id])
  end

  def profile
    render 'devise/profile' if current_user.email
  end
end
