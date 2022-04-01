class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    # @comment = Comment.new(params[:comment])
    @comment = @micropost.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @micropost.user
    else
      render 'shared/_comment_form'    
    end
  end

  private

  def comment_params
      params.require(:comment).permit(:content)
    end
end
