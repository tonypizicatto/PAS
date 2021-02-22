class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to request.referrer, notice: "Something wrong!"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_type, :commentable_id)
  end
end
