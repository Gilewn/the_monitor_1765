class Api::V1::PagesController < ApplicationController
  def index
    params[:category] = 'techcrunch' if params[:category].nil?
    @news = Hashie::Mash.new(HTTParty.get("https://newsapi.org/v1/articles?source=#{params[:category]}&apiKey=4019ed950c264a15ac44ac4bb4bde7dd"))
    render json: @news
  end
end
