class ReplysController < ApplicationController
    def create
        @micropost = Micropost.find(params[:micropost_id])
        @comment = Comment.find(params[:comment_id])
        @reply = @micropost.comments.reply.create(reply_params) 
        @reply.micropost = @micropost
        @reply.user = current_user
        @reply.comment = @comment
        
        if @reply.save
            flash[:success] = "Reply created!"
            redirect_to @micropost.user
        else
            render 'shared/_reply_form'    
        end
    end

    private

    def reply_params
        params.require(:reply).permit(:content)
    end   
end
