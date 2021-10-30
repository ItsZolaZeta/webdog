class Account::DogsController < ApplicationController

  def new
    @dog = Dog.new
  end

  # def create
  #   # @dog.create
  # end
  
  def edit  
    @dog = Dog.find(params[:id])
  end

  # def update
  #   # @dog.update
  # end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :birthday, :gender, :photo)
  end
end
