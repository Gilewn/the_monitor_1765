class CommentsController < ApplicationController
  before_action :get_user

  def get_user
    @user = User.find(params[:user_id])
  end

  def index
    @comments = @user.comments
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

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@user, @comment], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@user, @comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@user, @comment], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@user, @comment] }
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


  private

  def comment_params
    params.fetch(:comment, {}).permit(:body)
  end
end
