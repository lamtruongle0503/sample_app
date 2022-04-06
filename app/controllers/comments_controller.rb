class CommentsController < ApplicationController
    def new
        @micropost = Micropost.find(params[:micropost_id])
        @comment = @micropost.comments.create(parent_id: params[:parent_id])
    end

    def create
        @micropost = Micropost.find(params[:micropost_id])
        @comment = @micropost.comments.create(comment_params)

        if @comment.save 
            flash[:success] = "Comment posted!"
            redirect_to request.referrer || root_url
        else
            render 'static_pages/home'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :parent_id, :micropost_id, :user_id)
    end

end
