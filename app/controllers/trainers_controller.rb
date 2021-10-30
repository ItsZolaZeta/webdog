class TrainersController < ApplicationController

  before_action :set_trainer,              only: [:show]

  def index
    @trainers = User.where role: 'trainer'
  end

  def show
  end

  private
    def set_trainer
      @trainer = User.find(params[:id])
    end

end
