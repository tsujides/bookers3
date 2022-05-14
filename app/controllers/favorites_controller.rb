class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    # favorite = current_user.favorites.new(book_id: book.id)
    favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
    favorite.save

    # redirect_to request.referer
    @books = Favorite.ordered_book_list

    # 呼び出し元
    referer = Rails.application.routes.recognize_path(request.referer)
    if referer[:action] == 'show'
      render 'create-partial'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    # favorite = current_user.favorites.find_by(book_id: book.id)
    favorite = Favorite.find_by(user_id: current_user.id, book_id: @book.id)
    favorite.destroy

    # redirect_to request.referer
    @books = Favorite.ordered_book_list

    # 呼び出し元
    referer = Rails.application.routes.recognize_path(request.referer)
    if referer[:action] == 'show'
      render 'create-partial'
    end
  end

end
