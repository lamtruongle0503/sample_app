class CommentsController < ApplicationController

    
    def index
        @comments = Comment.hash_tree
      end
    def new 
        @comment = Comment.new(parent_id: params[:parent_id])
    end


    def create
        # @micropost = Micropost.find(params[:micropost_id])
        # @comment = @micropost.comments.create(params.require(:comment).permit(:content)) 
        # @comment.micropost = @micropost
        # @comment.user = current_user
        
        # if @comment.save
        #     flash[:success] = "Comment created!"
        #     redirect_to @micropost.user
        # else
        #     render 'shared/_comment_form'    
        # end
        if params[:comment][:parent_id].to_i > 0
            parent = Comment.find_by_id(params[:comment].delete(:parent_id))
            @comment = parent.children.build(comment_params)
          else
            @comment = Comment.new(comment_params)
          end
        
          if @comment.save
            flash[:success] = 'Your comment was successfully added!'
            redirect_to root_url
          else
            render 'new'
          end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
