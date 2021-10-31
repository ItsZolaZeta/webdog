class CommentsController < ApplicationController

  before_action :ensure_authenticated
  before_action :set_post
  before_action :ensure_admin_trainer_owner,   only: [:destroy] 

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post

    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully published.' }
      else
        format.html { redirect_to post_path(@comment.post), alert: 'Your comment was not published' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if(is_admin? || is_trainer? || current_user == @comment.user)
      @comment.destroy
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
    
    def ensure_admin_trainer_owner
      if(is_admin? || is_trainer? || @post.user == current_user)
        return
      else
        redirect_to post_path(@post)
      end
    end
end
