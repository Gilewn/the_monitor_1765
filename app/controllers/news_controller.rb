class NewsController < ApplicationController
  def show
    @new = New.find(params[:id])
  end

  def index
    @news = New.all
  end
end
