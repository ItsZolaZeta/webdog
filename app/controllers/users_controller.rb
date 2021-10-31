class UsersController < ApplicationController
  
  before_action :set_user,                only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin,            only: [:edit, :destroy]
  before_action :ensure_admin_or_trainer, only: [:index]
  before_action :ensure_admin_or_user,    only: [:update]

  def index
    @users = User.all.page(params[:page]) 
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'You have successfully signed up!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|

      if(@user == current_user)
        if @user.update(account_user_params)
          format.html { redirect_to account_path, notice: 'Your information was successfully updated.' }
        else
          format.html { redirect_to account_path, alert: 'We had a small problem...' }
        end
      elsif(is_admin?)
        if @user.update(edit_user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end

    end
  end

  def destroy
    respond_to do |format|
      if @user.destroy
        format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      else
        format.html { redirect_to users_path, alert: 'We had a small problem...' }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def edit_user_params
      params.require(:user).permit(:email, :name, :avatar, :role, :introduction)
    end

    def account_user_params
      params.require(:user).permit(:email, :name, :avatar, :introduction)
    end

    def ensure_admin
      if(is_admin?)
        return
      else
        redirect_to root_path
      end
    end

    def ensure_admin_or_user
      if(is_admin? || current_user == @user)
        return
      else
        redirect_to root_path
      end
    end

    def ensure_admin_or_trainer
      if(is_admin? || is_trainer?)
        return
      else
        redirect_to root_path
      end
    end

end
