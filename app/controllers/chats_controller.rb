class ChatsController < ApplicationController
  def show
    @chats = Chat.where(from: current_user, to: params[:id]).or(Chat.where(from: params[:id], to: current_user)).order(id: :asc)
    @chat = Chat.new
    @user = User.find(params[:id])
  end

  def create
    chat = Chat.new(
      from_id: current_user.id,
      to_id: params[:id],
      message: chat_params[:message])

    if !chat.save
      @error = "メッセージは140文字以内で入力してください。"
    end

    @chats = Chat.where(from: current_user, to: params[:id]).or(Chat.where(from: params[:id], to: current_user)).order(id: :asc)


    # redirect_to book_path(book.id)
  end

  private

  def chat_params
    params.require(:chat).permit(:message)
  end
end
