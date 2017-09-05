class NewsController < ApplicationController
  def show
    @new = New.find(params[:id])
  end
end
