class CommentsController < ApplicationController

  before_action :ensure_authenticated
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post

    @comment.user = current_user
    #respond_to
    # @comment.save

    respond_to do |format|
      if @comment.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully published.' }
      else
        format.html { redirect_to post_path(@comment.post), alert: 'Your comment was not published' }
      end
    end

    # redirect_to post_path(@comment.post)
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
end
