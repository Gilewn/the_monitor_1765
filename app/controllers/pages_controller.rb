class PagesController < ApplicationController
  def index
    @news = New.all
    @user = current_user
    @articles = Article.order(created_at: :desc).limit(2)
    if current_user
      @articles_side = @user.articles.limit(2)
    else
      @articles_side = Article.order(updated_at: :desc).limit(2)
    end
  end

  def profile
    render 'devise/profile' if current_user.email
  end
end
