class PostsController < ApplicationController

  before_action :set_post,                     only: [:show, :edit, :update, :destroy]
  before_action :ensure_authenticated,         only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_admin_trainer_owner,   only: [:edit, :update, :destroy] 

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]) 
    # change order, newest first
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Forum post was successfully published.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

      if(current_user == @post.user)
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'You have successfully updated your own forum post.' }
        else
          format.html { render :edit }
        end
      elsif(is_admin? || is_trainer?)
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Forum post was successfully updated.' }
        else
          format.html { render :edit }
        end
      else
        format.html { redirect_to posts_path, alert: 'You are unauthorized to modify this forum post.' }
      end

    end
  end

  def destroy
    respond_to do |format|

      if(current_user == @post.user)
        if @post.destroy
          format.html { redirect_to posts_path, notice: 'You have successfully deleted your own forum post.' }
        else
          format.html { render @post, alert: 'We had a small problem... please try again.' }
        end
      elsif( is_admin? || is_trainer? )
        if @post.destroy
          format.html { redirect_to posts_path, notice: 'Forum post was successfully deleted.' }
        else
          format.html { render @post, alert: 'We had a small problem... please try again.' }
        end
      else
        format.html { redirect_to posts_path, alert: 'You are unauthorized to delete this forum post.' }
      end

    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def ensure_admin_trainer_owner
      if(is_admin? || is_trainer? || @post.user == current_user)
        return
      else
        redirect_to post_path(@post)
      end
    end

end
