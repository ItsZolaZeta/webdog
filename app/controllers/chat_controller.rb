class ChatController < ApplicationController
  def index
    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user).order(id: :asc)
    existing = []

    for index in session[:conversations] do
      if(Conversation.exists?(index))
        existing.append(index)
      end
    end

    @conversations = Conversation.includes(:recipient, :messages).find(existing)
  end
end
