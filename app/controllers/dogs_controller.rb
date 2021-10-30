class DogsController < ApplicationController

  before_action :ensure_authenticated
  before_action :set_dog,                     only: [:edit, :update]
  before_action :ensure_owner,                only: [:edit, :update]

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user

    respond_to do |format|
      if @dog.save
        format.html { redirect_to edit_account_dog_path(@dog), notice: "Your dog's details were successfully saved." }
      else
        format.html { redirect_to new_account_dog_path, alert: "We had some troubles... please try again." }
      end
    end
  end

  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to edit_account_dog_path(@dog), notice: "Your dog's details were successfully updated." }
      else
        format.html { redirect_to edit_account_dog_path(@dog), alert: 'We had some troubles... please try again.' }
      end
    end
  end

  private

    def set_dog
      @dog = Dog.find(params[:id])
    end

    def ensure_owner 
      if(@dog.user == current_user)
        return
      else
        redirect_to account_path
      end
    end

    def dog_params
      params.require(:dog).permit(:name, :breed, :birthday, :gender, :photo)
    end
end
