class CommentsController < ApplicationController
  before_action :get_user
  # before_action :get_article

  def get_user
    @user = User.find(params[:user_id])
  end

  # def get_article
  #  @article = Article.find(params[:article_id])
  # end

  def index
    @comment = Comment.new
    # @comments = @user.comments
    @all_comments = Comment.order(created_at: :desc).all
  end

  def show
    @comment = @user.comments.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    @comment = @user.comments.new(comment_params)
    @all_comments = Comment.order(created_at: :desc).all
    # @article.id = @user.comments.find(params[:article_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_comments_url, notice: 'Comment was successfully created.' }
        format.json { render :index, status: :created, location: [@user, @comment] }
      else
        format.html { render :index }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@user, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :index, status: :ok, location: [@user, @comment] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @comment], notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.fetch(:comment, {}).permit(:body)
  end
end
