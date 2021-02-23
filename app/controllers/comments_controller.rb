class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_commentable, only: :create

  # def create
  #   @comment = current_user.comments.build(comment_params)
  #   if @comment.save
  #     redirect_back(fallback_location: root_path)
  #   else
  #     redirect_to request.referrer, notice: "Something wrong!"
  #   end
  # end
  #
  # def destroy
  # end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to request.referrer, notice: 'Your comment was successfully posted!'
    else
      redirect_to request.referrer, notice: "Your comment wasn't posted!"
    end
  end

  private

  def find_commentable
    @commentable_class = params[:comment][:commentable_type].safe_constantize
    @commentable = @commentable_class.find_by(id: params[:comment][:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
  end
end
