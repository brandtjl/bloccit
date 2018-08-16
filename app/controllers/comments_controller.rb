class CommentsController < ApplicationController
    before_action :require_sign_in # method in application_controller.rb
    before_action :authorize_user, only: [:destroy]

    def create
    # #11
        @post = Post.find(params[:post_id])
        comment = @post.comments.new(comment_params) # method defined below, to whitelist the parameters (can't remember why this is necessary!)
        comment.user = current_user
    
        if comment.save
            flash[:notice] = "Comment saved successfully."
    # #12
            redirect_to [@post.topic, @post]
        else
            flash[:alert] = "Comment failed to save."
    # #13
            redirect_to [@post.topic, @post]
        end
        end
        
    def destroy
        @post = Post.find(params[:post_id])
        comment = @post.comments.find(params[:id])
    
        if comment.destroy
            flash[:notice] = "Comment was deleted."
            redirect_to [@post.topic, @post]
        else
            flash[:alert] = "Comment couldn't be deleted. Try again."
            redirect_to [@post.topic, @post]
        end
    end

    private
# #14
    def comment_params
        params.require(:comment).permit(:body)
    end

    def authorize_user
        comment = Comment.find(params[:id])
        unless current_user == comment.user || current_user.admin?
          flash[:alert] = "You do not have permission to delete a comment."
          redirect_to [comment.post.topic, comment.post] # still confused as to how/why this indicates 'show' view
        end
    end
end
