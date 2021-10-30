class AccountController < ApplicationController
  
  before_action :ensure_authenticated
  
  def edit
    @user = current_user
    # @dog = current_user.dog
  end

  def update
    current_user.update(user_params)
    # current_user.dog.update(dog_params)
    redirect_to account_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :avatar, :introduction)
  end

end
