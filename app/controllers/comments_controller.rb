class CommentsController < ApplicationController

    def new 
        @comment = Comment.new
    end

    

    def create
        # @commentable = find_commentable
        # @comment = @commentable.comments.create(comment_params) 
        # @comment.user = current_user
        # @comment = @commentable.comments.build(comment_params)
        @micropost = Micropost.find(params[:micropost_id])
        @comment = @micropost.comments.create(comment_params) 
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

    def find_commentable
        Comment.find(params[:comment_id]) if params[:comment_id]
        Micropost.find(params[:micropost_id]) if params[:micropost_id]
    end
end
