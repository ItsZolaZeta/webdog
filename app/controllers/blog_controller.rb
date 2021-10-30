class BlogController < ApplicationController

  before_action :set_blog,                 only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_or_trainer,  only: [:new, :create, :edit, :update, :destroy]

  def index
    @blogs = Blogpost.all.page(params[:page]) 
  end

  def show
  end

  def new
    @blog = Blogpost.new
  end

  def edit
  end

  def create
    @blog = Blogpost.new(blog_params)
    @blog.user = current_user

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Your blogpost was successfully published.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

      if(is_trainer? && current_user == @blog.user)
        if @blog.update(blog_params)
          format.html { redirect_to @blog, notice: 'You have successfully updated your own blogpost.' }
        else
          format.html { render :edit }
        end
      elsif(is_admin?)
        if @blog.update(blog_params)
          format.html { redirect_to @blog, notice: 'The blogpost was successfully updated.' }
        else
          format.html { render :edit}
        end
      else
        format.html { redirect_to blogposts_path, alert: 'You are unauthorized to modify this blogpost.' }
      end

    end
  end

  def destroy
    respond_to do |format|

      if(is_trainer? && current_user == @blog.user)
        if @blog.destroy
          format.html { redirect_to blogposts_path, notice: 'You have successfully deleted your own blogpost.' }
        else
          format.html { render @blog, alert: 'We had a small problem... please try again.' }
        end
      elsif(is_admin?)
        if @blog.destroy
          format.html { redirect_to blogposts_path, notice: 'The blogpost was successfully deleted.' }
        else
          format.html { render @blog, alert: 'We had a small problem... please try again.' }
        end
      else
        format.html { redirect_to blogposts_path, alert: 'You are unauthorized to delete this blogpost.' }
      end

    end
  end

  private

    def set_blog
      @blog = Blogpost.find(params[:id])
    end

    def blog_params
      params.require(:blogpost).permit(:title, :meta, :body)
    end

    def ensure_admin_or_trainer
      if(is_admin? || is_trainer?)
        return
      else
        redirect_to blogposts_path
      end
    end

end
