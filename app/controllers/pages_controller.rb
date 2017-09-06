class PagesController < ApplicationController
  def index
    @news = New.all
    @articles = Article.all.order(created_at: :desc).limit(2)
    @articles_side = Article.all.order('user_id').limit(2)
  end

  def profile
    render 'devise/profile' if current_user.email
  end
end
