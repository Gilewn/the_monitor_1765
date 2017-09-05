class PagesController < ApplicationController
  def index
    @news = New.all
    @articles = Article.all.order('created_at').limit(2)
  end

  def profile
    render 'devise/profile' if current_user.email
  end
end
