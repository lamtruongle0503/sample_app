class CommentsController < ApplicationController

    def index
        @comments = Comment.all
      end
    
    def new
    end

    def create
        @micropost = Micropost.find(params[:micropost_id])
        # @comment = Comment.new(params[:comment])
        @comment = @micropost.comments.create(params.require(:comment).permit(:content)) 
        @comment.micropost = @micropost
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
